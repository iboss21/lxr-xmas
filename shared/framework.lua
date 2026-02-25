--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 Christmas Experience System - Framework Adapter Layer

    This file provides a unified interface for interacting with multiple frameworks.
    It automatically detects the active framework and maps function calls to the
    correct framework-specific implementations.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Tagline:     Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
    Description: ისტორია ცოცხლდება აქ! (History Lives Here!)
    Type:        Serious Hardcore Roleplay
    Access:      Discord & Whitelisted

    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io
    Server:      https://servers.redm.net/servers/detail/8gj7eb

    ═══════════════════════════════════════════════════════════════════════════════

    Version: 1.0.0

    Framework Support:
    - LXR Core  (Primary)   - Fully supported
    - RSG Core  (Primary)   - Fully supported
    - VORP Core (Supported) - Compatible
    - RedEM:RP  (Optional)  - If detected
    - QBR Core  (Optional)  - If detected
    - QR Core   (Optional)  - If detected
    - Standalone (Fallback) - Basic functionality

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Framework Adapter Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK DETECTION ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Framework = {}
Framework.Type = nil
Framework.Object = nil

-- Auto-detect framework based on priority order
local function DetectFramework()
    if Config.Framework ~= 'auto' then
        -- Manual framework selection
        Framework.Type = Config.Framework
        if Config.Debug then
            print('^3[LXR Xmas]^7 Framework manually set to: ^2' .. Framework.Type .. '^7')
        end
    else
        -- Auto-detection in priority order
        local detectionOrder = {
            'lxr-core',
            'rsg-core',
            'vorp_core',
            'redem_roleplay',
            'qbr-core',
            'qr-core'
        }

        for _, fw in ipairs(detectionOrder) do
            if GetResourceState(fw) == 'started' or GetResourceState(fw) == 'starting' then
                Framework.Type = fw
                if Config.Debug then
                    print('^3[LXR Xmas]^7 Auto-detected framework: ^2' .. fw .. '^7')
                end
                break
            end
        end

        -- Fallback to standalone
        if not Framework.Type then
            Framework.Type = 'standalone'
            if Config.Debug then
                print('^3[LXR Xmas]^7 No framework detected, running in ^2standalone^7 mode')
            end
        end
    end

    return Framework.Type
end

-- Initialize framework object
local function InitializeFramework()
    local fwType = DetectFramework()

    if fwType == 'lxr-core' then
        Framework.Object = exports['lxr-core']:GetCoreObject()
    elseif fwType == 'rsg-core' then
        Framework.Object = exports['rsg-core']:GetCoreObject()
    elseif fwType == 'vorp_core' then
        Framework.Object = exports.vorp_core:GetCore()
    elseif fwType == 'redem_roleplay' then
        Framework.Object = exports['redem_roleplay']:GetCoreObject()
    elseif fwType == 'qbr-core' then
        Framework.Object = exports['qbr-core']:GetCoreObject()
    elseif fwType == 'qr-core' then
        Framework.Object = exports['qr-core']:GetCoreObject()
    else
        -- Standalone mode — no framework object needed
        Framework.Object = nil
    end

    if Config.Debug then
        print('^3[LXR Xmas]^7 Framework initialized: ^2' .. (fwType or 'none') .. '^7')
    end
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CLIENT-SIDE ADAPTER ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

if IsDuplicityVersion and not IsDuplicityVersion() then
    -- CLIENT SIDE

    -- Initialize on resource start
    CreateThread(function()
        Wait(100)
        InitializeFramework()
    end)

    -- Send notification to local player
    function Framework.Notify(message, notifType, duration)
        notifType = notifType or 'inform'
        duration  = duration  or 5000

        if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core'
        or Framework.Type == 'qbr-core' or Framework.Type == 'qr-core' then
            TriggerEvent('ox_lib:notify', {
                type        = notifType,
                description = message,
                duration    = duration
            })
        elseif Framework.Type == 'vorp_core' then
            TriggerEvent('vorp:TipBottom', message, duration)
        elseif Framework.Type == 'redem_roleplay' then
            TriggerEvent('redem_roleplay:Notify', notifType, message, duration)
        else
            -- Standalone fallback — use chat message
            TriggerEvent('chat:addMessage', {
                args = { '[🐺 Xmas]', message }
            })
        end
    end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER-SIDE ADAPTER ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

else
    -- SERVER SIDE

    -- Initialize on resource start
    CreateThread(function()
        Wait(100)
        InitializeFramework()
    end)

    -- Send notification to a player (server-triggered)
    function Framework.Notify(source, message, notifType, duration)
        notifType = notifType or 'inform'
        duration  = duration  or 5000

        if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core'
        or Framework.Type == 'qbr-core' or Framework.Type == 'qr-core' then
            TriggerClientEvent('ox_lib:notify', source, {
                type        = notifType,
                description = message,
                duration    = duration
            })
        elseif Framework.Type == 'vorp_core' then
            TriggerClientEvent('vorp:TipBottom', source, message, duration)
        elseif Framework.Type == 'redem_roleplay' then
            TriggerClientEvent('redem_roleplay:Notify', source, notifType, message, duration)
        else
            -- Standalone fallback — use chat message
            TriggerClientEvent('chat:addMessage', source, {
                args = { '[🐺 Xmas]', message }
            })
        end
    end

    -- Check if a player has a specific permission (server-side)
    -- Falls back to FiveM/RedM ACE permission system when no framework is available
    function Framework.HasPermission(source, permission)
        permission = permission or 'command'

        if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' then
            local Player = Framework.Object.Functions.GetPlayer(source)
            if Player then
                return Player.Functions.HasPermission(permission)
            end
            return false
        elseif Framework.Type == 'vorp_core' then
            local User = Framework.Object.getUser(source)
            if User then
                return User.getGroup == 'admin' or User.getGroup == 'superadmin'
            end
            return false
        else
            -- Fallback: use FiveM/RedM ACE permissions
            return IsPlayerAceAllowed(source, permission)
        end
    end

    -- Log a server event (for debugging / monitoring)
    function Framework.Log(source, event, message, data)
        if Config.Debug then
            local playerName = GetPlayerName(source) or 'Unknown'
            print(string.format('^3[LXR Xmas]^7 [%s] %s: %s', playerName, event, message))
            if data then
                print('^3Data:^7 ' .. json.encode(data))
            end
        end
    end
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ EXPORT ████████████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

_G.Framework = Framework
