local boss_waypoints = {
	[4] = {
		{
			travel_dist = 685.502638489008,
			id = "boss_1",
			waypoints = {
				{
					-12,
					243,
					0,
					685.502638489008
				},
				{
					10,
					220,
					0,
					685.502638489008
				},
				{
					-12,
					188.59423828125,
					0,
					661.4577089846134
				}
			}
		}
	}
}
local patrol_waypoints = {
	{
		travel_dist = 232.5902271270752,
		id = "roaming_3",
		waypoints = {
			{
				10.674619674682617,
				45.702171325683594,
				0,
				232.5902271270752
			},
			{
				10.835441589355469,
				38.80733871459961,
				0,
				232.5902271270752
			},
			{
				6.995763778686523,
				35.88290786743164,
				0,
				227.8245269060135
			},
			{
				3.586088180541992,
				45.904476165771484,
				0,
				228.69016003608704
			}
		}
	},
	{
		travel_dist = 636.6810213625431,
		id = "roaming_2",
		waypoints = {
			{
				6,
				194.31007385253906,
				0,
				636.6810213625431
			},
			{
				6,
				112.33006286621094,
				0,
				636.6810213625431
			}
		}
	},
	{
		travel_dist = 676.8928515017033,
		id = "roaming_1",
		waypoints = {
			{
				6,
				235,
				0,
				676.8928515017033
			},
			{
				6,
				117,
				0,
				676.8928515017033
			}
		}
	}
}
local event_waypoints = {
	{
		travel_dist = 481.9417884349823,
		id = "event_1",
		waypoints = {
			{
				13.649999618530273,
				60.87999725341797,
				9.999999974752427e-07,
				481.9417884349823
			},
			{
				3.8126940727233887,
				63.44447708129883,
				0,
				481.9417884349823
			},
			{
				-13.179999351501465,
				57.77000045776367,
				0,
				472.8601784706116
			},
			{
				-3.3511149883270264,
				46.63126754760742,
				0,
				268.23331904411316
			},
			{
				14.90999984741211,
				-3.2899999618530273,
				0,
				244.84042859077454
			},
			{
				14.764113426208496,
				-19.278871536254883,
				0,
				187.97039937973022
			},
			{
				1.8049319982528687,
				-21.725149154663086,
				0,
				171.98154163360596
			},
			{
				-15.207253456115723,
				27.998977661132812,
				0,
				30.36005926132202
			}
		}
	}
}
local patrol_spline_version = "1"

return {
	version = patrol_spline_version,
	boss_waypoints = boss_waypoints,
	patrol_waypoints = patrol_waypoints,
	event_waypoints = event_waypoints
}
