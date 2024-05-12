-- utils.lua
-- Utility functions for the mod

utils = {}

-- this function is copied from Cephelos
--- Delays a function call by the specified number of milliseconds.
-- @param msDelay The delay in milliseconds before the function is called.
-- @param func The function to call after the delay. Should be a function or callable.
function utils.SDelayCall(msDelay, func) -- Delays a func call by msDelay milliseconds
    local startTime = Ext.Utils.MonotonicTime()
    local handlerId;
    handlerId = Ext.Events.Tick:Subscribe(function()
        if (Ext.Utils.MonotonicTime() - startTime > msDelay) then
            Ext.Events.Tick:Unsubscribe(handlerId)
            func()
        end
    end
    ) 
end

return utils

