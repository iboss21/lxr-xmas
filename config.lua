--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
                                                                         
    🐺 LXR Core - Christmas Experience System
    
    This configuration file controls the Christmas seasonal experience for RedM.
    Includes festive weather, ambient music via world phonographs, and
    decorative train ornaments. Fully configurable per server preferences.
    
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
    Performance Target: Optimized for minimal server overhead and client FPS impact
    
    Tags: RedM, Georgian, SeriousRP, Whitelist, Christmas, Seasonal, Weather, Music
    
    Framework Support:
    - LXR Core (Primary)
    - RSG Core (Compatible)
    - VORP Core (Compatible)
    - RedEM:RP (Compatible)
    - QBR Core (Compatible)
    - QR Core (Compatible)
    - Standalone (Compatible)
    
    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════
    
    Script Author: iBoss21 / The Lux Empire for The Land of Wolves
    Original Concept: nzkfc
    Inspired by: Seasonal immersion and holiday roleplay atmosphere
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-xmas"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[
        
        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════
        
        Expected: %s
        Got: %s
        
        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.
        
        🐺 wolves.land - The Land of Wolves
        
        ═══════════════════════════════════════════════════════════════════════════════
        
    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name        = 'The Land of Wolves 🐺',
    tagline     = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    description = 'ისტორია ცოცხლდება აქ!', -- History Lives Here!
    type        = 'Serious Hardcore Roleplay',
    access      = 'Discord & Whitelisted',

    -- Contact & Links
    website      = 'https://www.wolves.land',
    discord      = 'https://discord.gg/CrKcWdfd3A',
    github       = 'https://github.com/iBoss21',
    store        = 'https://theluxempire.tebex.io',
    serverListing = 'https://servers.redm.net/servers/detail/8gj7eb',

    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',

    -- Tags
    tags = {'RedM', 'Georgian', 'SeriousRP', 'Whitelist', 'Christmas', 'Seasonal', 'Weather', 'Music'}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK DETECTION ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Supported frameworks (in priority order):
--   'lxr'        - LXR Core (Primary)
--   'rsg'        - RSG Core (Primary)
--   'vorp'       - VORP Core (Supported / Legacy)
--   'redem'      - RedEM:RP (Optional)
--   'qbr'        - QBR Core (Optional)
--   'qr'         - QR Core (Optional)
--   'standalone' - No framework required

Config.Framework = 'auto' -- Set to 'auto' to detect, or specify manually

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CHRISTMAS MUSIC SETTINGS ██████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Music = {
    -- Stream URL for Christmas ambient music
    streamUrl = 'https://redm.khzae.net/xmas1.ogg',

    -- Audio attenuation: how quickly volume drops with distance
    -- Higher = drops faster. Default: 8.0
    attenuationFactor = 8.0,

    -- Default music volume (0–100). Can be changed via /xmas_vol command
    defaultVolume = 50,

    -- Loop the music stream
    loop = true
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ PHONOGRAPH LOCATIONS ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- World positions where Christmas phonographs play music.
-- Music volume is based on player distance to the nearest phonograph.

Config.Phonographs = {
    vector3(3352.95,  -639.82,   45.08),  -- Sisika
    vector3(-312.85,   798.83,  119.48),  -- Valentine
    vector3(-1811.78, -372.80,  161.90),  -- Strawberry
    vector3(-815.16,  -1312.52,  44.19),  -- Blackwater
    vector3(1346.93,  -1370.52,  80.99),  -- Rhodes
    vector3(2948.84,   518.82,   45.15),  -- Van Horn
    vector3(2630.60,  -1226.35,  53.17),  -- Saint Denis
    vector3(-3706.02, -2588.31, -12.82),  -- Armadillo
    vector3(-5516.50, -2914.97,  -1.26),  -- Tumbleweed
    vector3(2801.20,  -1164.42,  48.43),  -- Saint Denis 2
    vector3(2935.13,   1274.38,  43.65),  -- Annesburg
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ TRAIN DECORATION SETTINGS █████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Trains = {
    -- Vehicle models considered as trains
    trainModels = {
        'northsteamer01x'
    },

    -- Decoration prop to attach when a matching train is found
    decorationProp = 'mp006_p_veh_xmasnsteamer01x'
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ WEATHER SETTINGS ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Weather = {
    -- Initial weather type on resource start
    initialWeather = 'snowlight',

    -- Transition time in seconds for initial weather change
    transitionTime = 10.0,

    -- Transition darkness (false = no night forced)
    transitionDarkness = false,

    -- Play thunder on transition
    thunder = true,

    -- Markov-chain weather pattern probabilities.
    -- Each state maps to weighted transitions to other states.
    patterns = {
        ['snowlight'] = {
            ['snow']      = 20,
            ['snowlight'] = 30,
            ['clouds']    = 50
        },
        ['snow'] = {
            ['snow']      = 20,
            ['snowlight'] = 70,
            ['blizzard']  = 10
        },
        ['blizzard'] = {
            ['snow']     = 90,
            ['blizzard'] = 10
        },
        ['sunny'] = {
            ['sunny']  = 60,
            ['clouds'] = 40
        },
        ['clouds'] = {
            ['sunny']    = 30,
            ['overcast'] = 70
        },
        ['overcast'] = {
            ['clouds']    = 30,
            ['snowlight'] = 70
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ COMMAND SETTINGS ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Commands = {
    -- Command to adjust Christmas music volume (server-side, restricted)
    volumeCommand = 'xmas_vol'
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DEBUG SETTINGS ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Debug = false -- Enable debug prints and extra logging

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF CONFIGURATION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Startup banner (shared script — runs on both client and server)
CreateThread(function()
    Wait(1000)
    print([[

        ═══════════════════════════════════════════════════════════════════════════════

            ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
            ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
            ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
            ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
            ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
            ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

        ═══════════════════════════════════════════════════════════════════════════════
        🐺 CHRISTMAS EXPERIENCE SYSTEM - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════

        Version:      1.0.0
        Server:       ]] .. Config.ServerInfo.name .. [[

        Framework:    Auto-detect enabled
        Phonographs:  ]] .. #Config.Phonographs .. [[ world locations
        Weather:      ]] .. Config.Weather.initialWeather .. [[ (initial)
        Train Decor:  ]] .. Config.Trains.decorationProp .. [[

        Music URL:    ]] .. Config.Music.streamUrl .. [[
        Default Vol:  ]] .. Config.Music.defaultVolume .. [[%
        Debug:        ]] .. (Config.Debug and 'ENABLED' or 'DISABLED') .. [[

        ═══════════════════════════════════════════════════════════════════════════════

        Developer:    iBoss21 / The Lux Empire
        Website:      https://www.wolves.land
        Discord:      https://discord.gg/CrKcWdfd3A

        ═══════════════════════════════════════════════════════════════════════════════

    ]])
end)
