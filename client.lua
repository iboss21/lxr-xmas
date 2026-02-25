--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Christmas Experience System | Client Script
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- NUI CALLBACKS
-- ═══════════════════════════════════════════════════════════════════════════════

RegisterNUICallback('init', function(data, cb)
	cb(tonumber(GetResourceKvpString('maxVolume')) or Config.Music.defaultVolume)
end)

RegisterNetEvent('xmas:setMaxVolume', function(volume)
	SetResourceKvp('maxVolume', tostring(volume))

	SendNUIMessage {
		type   = 'setMaxVolume',
		volume = volume
	}

	Framework.Notify('🎵 Christmas music volume: ' .. volume .. '%', 'inform', 4000)
end)
