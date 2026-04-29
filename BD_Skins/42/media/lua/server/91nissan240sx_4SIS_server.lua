--****************************************************************
--** BD Vehicle Tints & Furs — 91 Nissan 240SX Four Sisters     **
--****************************************************************

require "DAMN_Parts";

N240_4SIS = N240_4SIS or {};

local tireItemToModel = {
	["Base.91nissan240sxOEM13"] = "Tire1",
	["Base.91nissan240sxOEM23"] = "Tire2",
	["Base.91nissan240sxG73"]   = "Tire3",
	["Base.91nissan240sxGT3"]   = "Tire4",
	["damnCraft.SmallTire1"]    = "Tire5",
};

DAMN.Parts:processConfigV2("N240_4SIS", {
	["TireFrontLeft"]  = { partId = "TireFrontLeft",  itemToModel = tireItemToModel, },
	["TireFrontRight"] = { partId = "TireFrontRight", itemToModel = tireItemToModel, },
	["TireRearLeft"]   = { partId = "TireRearLeft",   itemToModel = tireItemToModel, },
	["TireRearRight"]  = { partId = "TireRearRight",  itemToModel = tireItemToModel, },
});
