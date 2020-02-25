Prospecting = {}
local prospecting = exports['prospecting']

-- Add a node to collect
-- Data can be whatever and is returned with the node in the handler
function Prospecting.AddTarget(x, y, z, data)
    prospecting:AddProspectingTarget(x, y, z, data)
end

function Prospecting.AddTargets(list)
    prospecting:AddProspectingTargets(list)
end

function Prospecting.StartProspecting(player)
    prospecting:StartProspecting(player)
end

function Prospecting.StopProspecting(player)
    prospecting:StopProspecting(player)
end

function Prospecting.IsProspecting(player)
    return prospecting:IsProspecting(player)
end

-- Set this resources difficulty modifier
-- Does not affect other resources settings
function Prospecting.SetDifficulty(modifier)
    return prospecting:SetDifficulty(modifier)
end

function Prospecting.OnStart(handler)
    AddEventHandler("prospecting:onStart", function(player)
        handler(player)
    end)
end

function Prospecting.OnStop(handler)
    AddEventHandler("prospecting:onStop", function(player, time)
        handler(player, time)
    end)
end

-- Sets a handler function for collected nodes
-- Parameters are: player, data, x, y, z
function Prospecting.SetHandler(handler)
    AddEventHandler("prospecting:onCollected", function(player, resource, data, x, y, z)
        if resource == GetCurrentResourceName() then
            handler(player, data, x, y, z)
        end
    end)
end
