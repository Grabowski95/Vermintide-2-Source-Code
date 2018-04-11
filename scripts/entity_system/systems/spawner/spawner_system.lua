require("scripts/hub_elements/ai_spawner")

local function D(...)
	if script_data.debug_hordes then
		printf(...)
	end

	return 
end

SpawnerSystem = class(SpawnerSystem, ExtensionSystemBase)
local extensions = {
	"AISpawner"
}
local player_positions = PLAYER_POSITIONS
local script_data = script_data
SpawnerSystem.init = function (self, context, system_name)
	SpawnerSystem.super.init(self, context, system_name, extensions)

	self._spawn_list = {}
	self._active_spawners = {}
	self._enabled_spawners = {}
	self._disabled_spawners = {}
	self._num_hidden_spawners = 0
	self._id_lookup = {}
	self._raw_id_lookup = {}
	self._waiting_to_spawn = 0
	self._hidden_spawners = {}
	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "spawn_horde", "spawn_horde")

	self.hidden_spawners_broadphase = Broadphase(40, 512)
	self._breed_limits = {}

	return 
end
SpawnerSystem.running_spawners = function (self)
	return self._active_spawners
end
SpawnerSystem.enabled_spawners = function (self)
	return self._enabled_spawners
end
SpawnerSystem.hidden_spawners_lookup = function (self)
	return self._hidden_spawners
end
SpawnerSystem.register_enabled_spawner = function (self, spawner, terror_event_id, hidden)
	self._enabled_spawners[#self._enabled_spawners + 1] = spawner

	if terror_event_id then
		local lookup = self._id_lookup[terror_event_id]

		if not lookup then
			lookup = {}
			self._id_lookup[terror_event_id] = lookup
		end

		lookup[#lookup + 1] = spawner
	end

	if hidden then
		local pos = Unit.local_position(spawner, 0)

		Broadphase.add(self.hidden_spawners_broadphase, spawner, pos, 1)

		self._num_hidden_spawners = self._num_hidden_spawners + 1
		self._hidden_spawners[spawner] = true
	end

	return 
end
SpawnerSystem.hibernate_spawner = function (self, spawner, hibernate)
	local enabled_spawners = self._enabled_spawners
	local num_enabled_spawners = #enabled_spawners
	local disabled_spawners = self._disabled_spawners
	local spawner_was_hibernating = disabled_spawners[spawner]

	print("hibernate_spawner:", hibernate)

	if hibernate then
		if not spawner_was_hibernating then
			for i = 1, num_enabled_spawners, 1 do
				if enabled_spawners[i] == spawner then
					enabled_spawners[i] = enabled_spawners[num_enabled_spawners]
					enabled_spawners[num_enabled_spawners] = nil
					disabled_spawners[spawner] = true
				end
			end
		else
			print("Can't hibernate spawner, it was already hibernating!")
		end
	elseif spawner_was_hibernating then
		disabled_spawners[spawner] = nil
		enabled_spawners[#enabled_spawners + 1] = spawner
	else
		print("Can't wake up spawner, it wasn't hibernating")
	end

	return 
end
SpawnerSystem.register_raw_spawner = function (self, spawner, terror_event_id)
	if terror_event_id then
		local lookup = self._raw_id_lookup[terror_event_id]

		if not lookup then
			lookup = {}
			self._raw_id_lookup[terror_event_id] = lookup
		end

		lookup[#lookup + 1] = spawner
	end

	return 
end
local spawn_list = {}
local spawn_list_hidden = {}
local copy_list = {}
SpawnerSystem.spawn_horde = function (self, spawner, amount, breeds, breed_list, group_template)
	local extension = ScriptUnit.extension(spawner, "spawner_system")
	self._active_spawners[spawner] = extension

	if breed_list then
		if group_template then
			table.clear(spawn_list)

			local num_to_spawn = #breed_list

			for i = 1, num_to_spawn, 1 do
				local breed_name = breed_list[i]
				breed_data = {
					breed_name,
					group_template
				}
				spawn_list[i] = breed_data
			end

			extension.on_activate(extension, amount, breeds, spawn_list)
		else
			extension.on_activate(extension, amount, breeds, breed_list)
		end
	else
		extension.on_activate(extension, amount, breeds)
	end

	self._waiting_to_spawn = self._waiting_to_spawn + amount
	local spawn_rate = extension.spawn_rate(extension)

	return spawn_rate
end

local function copy_array(source, index_a, index_b, dest)
	local j = 1

	for i = index_a, index_b, 1 do
		dest[j] = source[i]
		j = j + 1
	end

	return 
end

SpawnerSystem.set_breed_event_horde_spawn_limit = function (self, breed_name, limit)
	self._breed_limits[breed_name] = limit

	return 
end
local temp_spawn_list_per_breed = {}
local exchange_order = {}
local i = 1

for name, data in pairs(Breeds) do
	exchange_order[i] = name
	i = i + 1
end

table.sort(exchange_order, function (name1, name2)
	return Breeds[name1].exchange_order < Breeds[name2].exchange_order
end)
table.dump(exchange_order)

SpawnerSystem._try_spawn_breed = function (self, breed_name, spawn_list_per_breed, spawn_list, breed_limits, active_enemies, group_template)
	local amount = spawn_list_per_breed[breed_name]

	if amount then
		D("trying to spawn %i %s", amount, breed_name)

		local limit = breed_limits[breed_name]

		if limit then
			local overflow = math.min((active_enemies + amount) - limit.max_active_enemies, amount)

			D("overflow is %i (active:%i max:%i)", overflow, active_enemies, limit.max_active_enemies)

			local ratio = limit.exchange_ratio

			if ratio < overflow then
				local exchanged_amount = math.floor(overflow / ratio)
				amount = amount - exchanged_amount * ratio
				local exchange_breed = limit.spawn_breed

				if type(exchange_breed) == "table" then
					local num_breeds = #exchange_breed

					for i = 1, exchanged_amount, 1 do
						local breed_index = Math.random(1, num_breeds)
						local exchange_breed_name = exchange_breed[breed_index]
						spawn_list_per_breed[exchange_breed_name] = (spawn_list_per_breed[exchange_breed_name] or 0) + 1

						D("replacing %i %s with %i %s", ratio, breed_name, 1, exchange_breed_name)
					end

					for i = 1, num_breeds, 1 do
						active_enemies = active_enemies + self._try_spawn_breed(self, exchange_breed[i], spawn_list_per_breed, spawn_list, breed_limits, active_enemies, group_template)
					end
				else
					D("replacing %i %s with %i %s", exchanged_amount * ratio, breed_name, exchanged_amount, exchange_breed)

					spawn_list_per_breed[exchange_breed] = (spawn_list_per_breed[exchange_breed] or 0) + exchanged_amount
					active_enemies = active_enemies + self._try_spawn_breed(self, exchange_breed, spawn_list_per_breed, spawn_list, breed_limits, active_enemies, group_template)
				end
			end
		end

		D("amount remaining %i", amount)

		local start = #spawn_list + 1
		active_enemies = active_enemies + amount

		if group_template then
			group_template.size = group_template.size + amount
			breed_data = {
				breed_name,
				group_template
			}

			for j = start, (start + amount) - 1, 1 do
				spawn_list[j] = breed_data
			end
		else
			for j = start, (start + amount) - 1, 1 do
				spawn_list[j] = breed_name
			end
		end
	end

	return active_enemies
end
SpawnerSystem._fill_spawners = function (self, spawn_list, spawners, limit_spawners)
	local num_spawners_to_use = #spawners

	table.shuffle(spawners)

	if limit_spawners then
		for i = limit_spawners + 1, num_spawners_to_use, 1 do
			spawners[i] = nil
		end

		num_spawners_to_use = #spawners
	end

	local start_index = 1
	local total_amount = #spawn_list

	for i = 1, num_spawners_to_use, 1 do
		local to_spawn = math.floor(total_amount / (num_spawners_to_use - i + 1))

		D("\t spawner %i gets %i rats.", i, to_spawn)

		total_amount = total_amount - to_spawn
		local spawner = spawners[i]
		local extension = ScriptUnit.extension(spawner, "spawner_system")
		self._active_spawners[spawner] = extension

		table.clear_array(copy_list, #copy_list)
		copy_array(spawn_list, start_index, (start_index + to_spawn) - 1, copy_list)
		extension.on_activate(extension, to_spawn, nil, copy_list)

		start_index = start_index + to_spawn
	end

	return #spawn_list
end
SpawnerSystem.spawn_horde_from_terror_event_id_composition = function (self, event_id, composition_type, limit_spawners, group_template, strictly_not_close_to_players)
	local composition = CurrentHordeSettings.compositions[composition_type]
	local index = LoadedDice.roll_easy(composition.loaded_probs)
	local difficulty = Managers.state.difficulty.difficulty
	local difficulty_breeds = variant.difficulty_breeds
	local breed_list = (difficulty_breeds and difficulty_breeds[difficulty]) or variant.breeds
	local variant = composition[index]

	self.spawn_horde_from_terror_event_id(self, event_id, variant, limit_spawners, group_template, strictly_not_close_to_players, composition_type)

	return 
end
local ok_spawner_breeds = {
	skaven_clan_rat = true,
	skaven_slave = true
}
SpawnerSystem.spawn_horde_from_terror_event_id = function (self, event_id, variant, limit_spawners, group_template, strictly_not_close_to_players, optional_composition_type)
	local ConflictUtils = ConflictUtils
	local must_use_hidden_spawners = variant.must_use_hidden_spawners
	local spawners, hidden_spawners, event_spawn = nil
	local dont_remove_this = math.random()

	if event_id and event_id ~= "" then
		local source_spawners = self._id_lookup[event_id]

		if not source_spawners then
			assert("No horde spawners found with terror_id ", event_id)

			return 
		end

		spawners = {}

		copy_array(source_spawners, 1, #source_spawners, spawners)

		event_spawn = true
	else
		if strictly_not_close_to_players then
			spawners, hidden_spawners = ConflictUtils.filter_horde_spawners_strictly(player_positions, self._enabled_spawners, self._hidden_spawners, 10, 35)
		else
			spawners, hidden_spawners = ConflictUtils.filter_horde_spawners(player_positions, self._enabled_spawners, self._hidden_spawners, 10, 35)
		end

		if must_use_hidden_spawners and #hidden_spawners == 0 then
			local pos = PLAYER_POSITIONS[1]

			if pos then
				local spawner = ConflictUtils.get_random_hidden_spawner(pos, 40)

				if spawner then
					hidden_spawners = {
						spawner
					}
				end
			end

			if #hidden_spawners == 0 then
				print("Can't find any hidden spawners for this breed")

				return 
			end
		end

		if not next(spawners) then
			D("No horde spawners found within range for terror event %s", tostring(event_id))

			return 
		end
	end

	local num_spawners = #spawners

	if num_spawners == 0 then
		return 
	end

	local difficulty = Managers.state.difficulty.difficulty
	local difficulty_breeds = variant.difficulty_breeds
	local breed_list = (difficulty_breeds and difficulty_breeds[difficulty]) or variant.breeds
	local spawn_list = spawn_list

	table.clear_array(spawn_list, #spawn_list)

	local spawn_list_hidden = spawn_list_hidden

	table.clear_array(spawn_list_hidden, #spawn_list_hidden)
	D("Spawning horde from terror event id: %q, composition_type: %s, limit_spawners: %s", event_id, tostring(optional_composition_type), tostring(limit_spawners))

	for i = 1, #breed_list, 2 do
		local breed_name = breed_list[i]
		local amount = breed_list[i + 1]
		local num_to_spawn = nil

		if type(amount) == "table" then
			num_to_spawn = Math.random(amount[1], amount[2])

			D("\t ...will spawn %i of %s (%i->%i)", num_to_spawn, breed_name, amount[1], amount[2])
		else
			num_to_spawn = amount

			D("\t ...will spawn %i of %s (%i)", num_to_spawn, breed_name, amount)
		end

		temp_spawn_list_per_breed[breed_name] = num_to_spawn
	end

	local exchange_order = exchange_order
	local breed_limits = self._breed_limits
	local num_breeds = #exchange_order
	local active_enemies = Managers.state.performance:num_active_enemies()

	for i = 1, num_breeds, 1 do
		local breed_name = exchange_order[i]

		if event_spawn or ok_spawner_breeds[breed_name] then
			self._try_spawn_breed(self, breed_name, temp_spawn_list_per_breed, spawn_list, breed_limits, active_enemies, group_template)
		else
			self._try_spawn_breed(self, breed_name, temp_spawn_list_per_breed, spawn_list_hidden, breed_limits, active_enemies, group_template)
		end
	end

	table.clear(temp_spawn_list_per_breed)
	table.shuffle(spawn_list)

	local count = 0
	local hidden_count = 0
	count = self._fill_spawners(self, spawn_list, spawners, limit_spawners)

	if not event_spawn and must_use_hidden_spawners then
		hidden_count = self._fill_spawners(self, spawn_list_hidden, hidden_spawners, limit_spawners)

		if 0 < hidden_count then
			return "success", count + hidden_count
		end
	end

	if 0 < count then
		return "success", count
	end

	return 
end
SpawnerSystem.change_spawner_id = function (self, unit, spawner_id, new_spawner_id)
	if unit then
		local old_id = Unit.get_data(unit, "terror_event_id")

		if old_id ~= "" and old_id == new_spawner_id then
			return 
		end

		local old_spawners = self._id_lookup[old_id]

		if old_spawners then
			local num_spawners = #old_spawners

			for i = 1, num_spawners, 1 do
				if old_spawners[i] == unit then
					old_spawners[i] = old_spawners[num_spawners]
					old_spawners[num_spawners] = nil

					break
				end
			end
		end

		local new_spawners = self._id_lookup[new_spawner_id]

		if not new_spawners then
			new_spawners = {}
			self._id_lookup[new_spawners] = new_spawners
		end

		new_spawners[#new_spawners + 1] = unit

		Unit.set_data(unit, "terror_event_id", new_spawner_id)

		return 
	end

	local spawners = self._id_lookup[spawner_id]
	local new_spawners = self._id_lookup[new_spawner_id]

	if not new_spawners then
		new_spawners = {}
		self._id_lookup[new_spawners] = new_spawners
	end

	if spawners then
		local old_start_index = #spawners
		local new_start_index = #new_spawners

		for i = 1, old_start_index, 1 do
			new_spawners[new_start_index + i] = spawners[i]

			Unit.set_data(spawners[i], "terror_event_id", new_spawner_id)

			spawners[i] = nil
		end
	else
		print("Can't find spawners called: ", spawner_id, " so cannot rename any")
	end

	return 
end
SpawnerSystem.get_raw_spawner_unit = function (self, terror_id)
	local spawners = self._raw_id_lookup[terror_id]

	if spawners then
		local spawner_unit = spawners[math.random(1, #spawners)]
		local idle_animation = Unit.get_data(spawner_unit, "idle_animation")

		return spawner_unit, idle_animation
	end

	return 
end
SpawnerSystem.deactivate_spawner = function (self, spawner)
	self._active_spawners[spawner] = nil

	return 
end
SpawnerSystem.debug_show_spawners = function (self, t, spawners)
	local h = 70
	local add_height = Vector3(0, 0, h)
	local color = Color(255, 0, 200, 0)

	for unit, _ in pairs(spawners) do
		local pos = Unit.local_position(unit, 0)

		QuickDrawer:line(pos, pos + add_height, color)

		local d = 7 * t % 10

		QuickDrawer:sphere(pos + Vector3(0, 0, d), 0.5, color)
		QuickDrawer:sphere(pos + Vector3(0, 0, (d + 10) % h), 0.5, color)
		QuickDrawer:sphere(pos + Vector3(0, 0, (d + 20) % h), 0.5, color)
	end

	return 
end
SpawnerSystem.set_spawn_list = function (self, list)
	self._spawn_list = list

	return 
end
SpawnerSystem.pop_pawn_list = function (self)
	local spawn_list = self._spawn_list
	local size = #spawn_list

	if size <= 0 then
		return 
	end

	local breed = spawn_list[size]
	spawn_list[size] = nil

	return breed
end
SpawnerSystem.add_waiting_to_spawn = function (self, amount)
	self._waiting_to_spawn = self._waiting_to_spawn + amount

	return 
end
SpawnerSystem.waiting_to_spawn = function (self)
	return self._waiting_to_spawn
end
local dummy_input = {}
local found_hidden_spawners = {}
SpawnerSystem.update = function (self, context, t, dt)
	for unit, extension in pairs(self._active_spawners) do
		extension.update(extension, unit, dummy_input, dt, context, t)
	end

	if script_data.show_hidden_spawners then
		self.show_hidden_spawners(self, t)
	end

	return 
end
SpawnerSystem.show_hidden_spawners = function (self, t)
	local unit_local_position = Unit.local_position
	local center_pos = PLAYER_POSITIONS[1]
	local free_flight_manager = Managers.free_flight
	local in_free_flight = free_flight_manager.active(free_flight_manager, "global")

	if in_free_flight then
		center_pos = free_flight_manager.camera_position_rotation(free_flight_manager)
	end

	local s = math.sin(t * 10)
	local color = Color(192 + 64 * s, 192 + 64 * s, 0)
	local fail_color = Color(192 + 64 * s, 0, 0)
	local amount = 0
	local bad = 0
	local radius = 40

	if center_pos then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		amount = Broadphase.query(self.hidden_spawners_broadphase, center_pos, radius, found_hidden_spawners)
		local spinn = math.sin(t * 5) * 0.33
		local spinn_vec = Vector3(spinn, spinn, 0)
		local h_pos = Vector3(spinn, spinn, 30)

		for i = 1, amount, 1 do
			local spawner_unit = found_hidden_spawners[i]
			local pos = unit_local_position(spawner_unit, 0)
			local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, pos, 0.5, 0.5)

			if is_position_on_navmesh then
				QuickDrawer:line(pos + spinn_vec, pos + h_pos, color)
				QuickDrawer:sphere(pos, 0.15, color)
			else
				QuickDrawer:line(pos + spinn_vec, pos + h_pos, fail_color)
				QuickDrawer:sphere(pos, 0.15, color)

				bad = bad + 1
			end
		end
	end

	if bad == 0 then
		Debug.text("This level has %d hidden spawners. (%d within %d meters)", self._num_hidden_spawners, amount, radius)

		if center_pos then
			QuickDrawer:circle(center_pos + Vector3(0, 0, 20), radius, Vector3.up(), color)
		end
	else
		Debug.text("This level has %d hidden spawners. (%d within %d meters, %d are not on nav-mesh)", self._num_hidden_spawners, amount, radius, bad)

		if center_pos then
			QuickDrawer:circle(center_pos + Vector3(0, 0, 20), radius, Vector3.up(), fail_color)
		end
	end

	return 
end

return 
