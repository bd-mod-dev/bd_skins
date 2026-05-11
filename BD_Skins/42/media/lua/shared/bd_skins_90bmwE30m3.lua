--****************************************************************
--** BD Vehicle Simple Skins and Tints — 90 BMW E30 M3          **
--****************************************************************

local skins = {
    "Vehicles/Vehicles_90bmwE30m3_RotWeiss",
    "Vehicles/Vehicles_90bmwE30m3_RotWeiss2",
    "Vehicles/Vehicles_90bmwE30m3_Stripes",
}

Events.OnGameBoot.Add(function()
    for _, tex in ipairs(skins) do
        DAMN.ScriptTools:addSkinToVehicleScript("Base.90bmwE30m3", tex);
    end
end)
