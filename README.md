# Summary

# Installation
Checkout/Download the project to your chosen file system location, preferably `%USERPROFILE%\Saved Games\DCS\Scripts\dcs-api-bridge`

Add a `Mission Start` trigger and add an `Action` of type `DO SCRIPT FILE` referncing the `main.lua`

## Optional (For development)
In order to prevent having to re-select the file in the editor each time you make changes.

Add `apiBridge = { require = require }` to the top of the `MissionScripting.lua` file and comment out the `sanitizeModule('lfs')`

Amend the trigger to reference `main_preload.lua`

**NOTE: You must have the project installed in the `%USERPROFILE%\Saved Games\DCS\Scripts\dcs-api-bridge` location or update the path to `main.lua` in the `main_preload.lua` file.**

Example `MissionScripting.lua` (DCS_WORLD_INSTALL_FOLDER\Scripts\MissionScripting.lua)
```
apiBridge = { require = require }

--Initialization script for the Mission lua Environment (SSE)

dofile('Scripts/ScriptingSystem.lua')

--Sanitize Mission Scripting environment
--This makes unavailable some unsecure functions. 
--Mission downloaded from server to client may contain potentialy harmful lua code that may use these functions.
--You can remove the code below and make availble these functions at your own risk.

local function sanitizeModule(name)
	_G[name] = nil
	package.loaded[name] = nil
end

do
	sanitizeModule('os')
	sanitizeModule('io')
	-- sanitizeModule('lfs')
	require = nil
	loadlib = nil
end
```