--[[
    DRIP CLIENT SOLUTIONS | BROOKHAVEN RP
    Dev: VinzzDrip
    Version: 3.0
    Loader Script
]]

local function checkExecutor()
    local executors = {
        "Synapse", "ScriptWare", "Krnl", "Fluxus", "Delta", "Arceus",
        "Electron", "Valyse", "Oxygen", "Comet", "Vega", "Coco"
    }
    
    for _, exec in ipairs(executors) do
        if identifyexecutor and identifyexecutor():find(exec) then
            return true
        end
    end
    return true -- Allow all
end

if not checkExecutor() then
    return game:GetService("Players").LocalPlayer:Kick("Executor not supported!")
end

local function loadDripClient()
    local success, result = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/VinzzDrip/DripClient/main/DripClient.lua")
    end)
    
    if success then
        loadstring(result)()
    else
        warn("Failed to load Drip Client: " .. result)
    end
end

loadDripClient()