local mt = getrawmetatable(game)
local oldindex = mt.__index
local oldnewindex = mt.__newindex
local Players = game:GetService('Players')['LocalPlayer']
local Character = Players.Character or Players.CharacterAdded:Wait()
setreadonly(mt, false)

local hum = Players.Character.Humanoid
local ows = hum.WalkSpeed
local ojp = hum.JumpPower
local cmzd = Players.CameraMaxZoomDistance

mt.__newindex = newcclosure(function(t, k, v)
    if checkcaller() then
        return oldnewindex(t,k,v)
    elseif (t:IsA'Humanoid' and k == 'WalkSpeed') then
        v = tonumber(v)
        if not v then v = 0 end
        ows = v
    elseif (t:IsA'Humanoid' and k == 'JumpPower') then
        v = tonumber(v)
        if not v then v = 0 end
        ojp = v
    elseif (t:IsA'Player' and k == 'CameraMaxZoomDistance') then
        v = tonumber(v)
        if not v then v = 0 end
        cmzd = v
    else
        return oldnewindex(t,k,v)
    end
end)
mt.__index = newcclosure(function(t, k)
    if checkcaller() then
        return oldindex(t,k)
    elseif (t:IsA'Humanoid' and k == 'WalkSpeed') then
        return ows
    elseif (t:IsA'Humanoid' and k == 'JumpPower') then
        return ojp
    elseif (t:IsA'Player' and k == 'CameraMaxZoomDistance') then
        return cmzd
    else
        return oldindex(t,k)
    end
end)
setreadonly(mt, true)
