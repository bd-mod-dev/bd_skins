--****************************************************************
--** BD Vehicle Simple Skins and Tints — 91 Nissan 240SX        **
--****************************************************************

local skins = {
    "Vehicles/Vehicles_91nissan240sx_BlueSky",
    "Vehicles/Vehicles_91nissan240sx_GoldTail",
    "Vehicles/Vehicles_91nissan240sx_LavanderG",
    "Vehicles/Vehicles_91nissan240sx_LollyPop",
    "Vehicles/Vehicles_91nissan240sx_Oranged",
    "Vehicles/Vehicles_91nissan240sx_Pinkey",
}

Events.OnGameBoot.Add(function()
    for _, tex in ipairs(skins) do
        DAMN.ScriptTools:addSkinToVehicleScript("Base.91nissan240sx", tex);
        DAMN.ScriptTools:addSkinToVehicleScript("Base.91nissan240sx2", tex);
    end
end)
