--****************************************************************
--** BD Vehicle Tints & Furs — 91 Nissan 240SX Four Sisters     **
--****************************************************************

require "Hooks/DAMN_VehicleMenu";

DAMN      = DAMN      or {};
N240      = N240      or {};
N240_4SIS = N240_4SIS or {};

DAMN.VehicleMenu:registerConditionalSlice(function(radialMenu, playerObj, vehicle, vehicleScriptName)
    if vehicleScriptName ~= "Base.91nissan240sx2_4SIS" then return end

    local part = vehicle:getPartById("N240Sunroof");
    if not (part and DAMN.Parts:partIsInstalled(part)) then return end

    local door = part:getDoor();
    if not door then return end

    if door:isOpen() then
        radialMenu:addSlice(getText("IGUI_DAMN_close_sunroof"), getTexture("media/textures/Slice_N240_windsr.png"), function()
            vehicle:playPartAnim(part, "Close");
            door:setOpen(false);
        end);
    else
        radialMenu:addSlice(getText("IGUI_DAMN_open_sunroof"), getTexture("media/textures/Slice_N240_windsr.png"), function()
            vehicle:playPartAnim(part, "Open");
            door:setOpen(true);
        end);
    end
end, "toggle_N240Sunroof_4SIS");
