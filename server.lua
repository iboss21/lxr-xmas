--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Christmas Experience System | Server Script
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- WEATHER SYNC
-- ═══════════════════════════════════════════════════════════════════════════════

CreateThread(function()
	Wait(0)

	exports.weathersync:setWeatherPattern(Config.Weather.patterns)
	exports.weathersync:setWeather(Config.Weather.initialWeather, Config.Weather.transitionTime, Config.Weather.transitionDarkness, Config.Weather.thunder)
end)

AddEventHandler('onResourceStop', function(resource)
	if GetCurrentResourceName() ~= resource then
		return
	end

	exports.weathersync:resetWeatherPattern()
	exports.weathersync:resetWeather()
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- COMMANDS
-- ═══════════════════════════════════════════════════════════════════════════════

RegisterCommand(Config.Commands.volumeCommand, function(source, args, raw)
	local volume = tonumber(args[1])

	if volume == nil then
		volume = Config.Music.defaultVolume
	elseif volume > 100 then
		volume = 100
	elseif volume < 0 then
		volume = 0
	end

	TriggerClientEvent('xmas:setMaxVolume', source, volume)

	Framework.Notify(source, '🎵 Christmas music volume set to ' .. volume .. '%', 'success', 4000)

	if Config.Debug then
		Framework.Log(source, 'VOLUME_SET', 'Admin changed music volume', { volume = volume })
	end
end, true)
