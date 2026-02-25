--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Christmas Experience System | Phonographs
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- PHONOGRAPH AUDIO ENGINE
-- ═══════════════════════════════════════════════════════════════════════════════

function GetListenerCoords()
	local cam = GetRenderingCam()

	if cam == -1 then
		local ped = PlayerPedId()

		if IsPedDeadOrDying(ped) then
			return GetGameplayCamCoord()
		else
			return GetEntityCoords(ped)
		end
	else
		return GetCamCoord(cam)
	end
end

CreateThread(function()
	while true do
		Wait(100)

		local pos = GetListenerCoords()
		local minDistance = nil

		for _, phonograph in ipairs(Config.Phonographs) do
			local distance = #(pos - phonograph)

			if not minDistance or distance < minDistance then
				minDistance = distance
			end
		end

		SendNUIMessage({
			type = 'updateDistance',
			distance = minDistance
		})
	end
end)
