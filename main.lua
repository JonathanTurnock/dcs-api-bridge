local LOGGER_NAMESPACE = "API_BRIDGE"
local JSON = loadfile("Scripts\\JSON.lua")()

function info(msg)
    log.write(LOGGER_NAMESPACE, log.INFO, msg)
end

info("API Bridge Started")

local blueGroups = coalition.getGroups(coalition.side.BLUE)
info(encode_pretty(blueGroups))