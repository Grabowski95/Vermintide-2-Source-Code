require("math")

local __author__ = "Daniel Lindsley"
local __version__ = "scm-1"
local __license__ = "BSD"
local index_table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

function to_binary(integer)
	local remaining = tonumber(integer)
	local bin_bits = ""

	for i = 7, 0, -1 do
		local current_power = math.pow(2, i)

		if current_power <= remaining then
			bin_bits = bin_bits .. "1"
			remaining = remaining - current_power
		else
			bin_bits = bin_bits .. "0"
		end
	end

	return bin_bits
end

function from_binary(bin_bits)
	return tonumber(bin_bits, 2)
end

function to_base64(to_encode)
	local bit_pattern = ""
	local encoded = ""
	local trailing = ""

	for i = 1, string.len(to_encode), 1 do
		bit_pattern = bit_pattern .. to_binary(string.byte(string.sub(to_encode, i, i)))
	end

	if string.len(bit_pattern)%3 == 2 then
		trailing = "=="
		bit_pattern = bit_pattern .. "0000000000000000"
	elseif string.len(bit_pattern)%3 == 1 then
		trailing = "="
		bit_pattern = bit_pattern .. "00000000"
	end

	for i = 1, string.len(bit_pattern), 6 do
		local byte = string.sub(bit_pattern, i, i + 5)
		local offset = tonumber(from_binary(byte))
		encoded = encoded .. string.sub(index_table, offset + 1, offset + 1)
	end

	return string.sub(encoded, 1, string.len(trailing) - -1) .. trailing
end

function from_base64(to_decode)
	local padded = to_decode.gsub(to_decode, "%s", "")
	local unpadded = padded.gsub(padded, "=", "")
	local bit_pattern = ""
	local decoded = ""

	for i = 1, string.len(unpadded), 1 do
		local char = string.sub(to_decode, i, i)
		local offset, _ = string.find(index_table, char)

		if offset == nil then
			error("Invalid character '" .. char .. "' found.")
		end

		bit_pattern = bit_pattern .. string.sub(to_binary(offset - 1), 3)
	end

	for i = 1, string.len(bit_pattern), 8 do
		local byte = string.sub(bit_pattern, i, i + 7)
		decoded = decoded .. string.char(from_binary(byte))
	end

	local padding_length = padded.len(padded) - unpadded.len(unpadded)

	if padding_length == 1 or padding_length == 2 then
		decoded = decoded.sub(decoded, 1, -2)
	end

	return decoded
end

return 
