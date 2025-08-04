-- Main.lua
local repo = "https://raw.githubusercontent.com/ebrahim779/ZenithHub/main/"

local function LoadModule(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(repo .. path))()
    end)
    if success then
        return result
    else
        warn("Failed to load module: " .. path)
        return nil
    end
end

local UI = LoadModule("UI.lua")
local AutoFarm = LoadModule("Modules/AutoFarm.lua")
local AutoBreak = LoadModule("Modules/AutoBreak.lua")
local KillAura = LoadModule("Modules/KillAura.lua")
local RemoteFinder = LoadModule("Modules/RemoteFinder.lua")

if UI and AutoFarm and AutoBreak and KillAura and RemoteFinder then
    UI.Init(AutoFarm, AutoBreak, KillAura, RemoteFinder)
else
    warn("One or more modules failed to load.")
end
