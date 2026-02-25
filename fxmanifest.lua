--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Christmas Experience System - FiveM Resource Manifest

    ═══════════════════════════════════════════════════════════════════════════════
    RESOURCE INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Resource Name:  lxr-xmas
    Version:        1.0.0
    Author:         iBoss21 / The Lux Empire
    Description:    Multi-framework Christmas experience system for RedM.
                    Festive weather, ambient phonograph music, and decorated trains.

    Server:         The Land of Wolves 🐺
    Website:        https://www.wolves.land
    Discord:        https://discord.gg/CrKcWdfd3A

    ═══════════════════════════════════════════════════════════════════════════════
    FRAMEWORK SUPPORT
    ═══════════════════════════════════════════════════════════════════════════════

    Primary:
    - LXR Core (lxr-core)
    - RSG Core (rsg-core)

    Supported:
    - VORP Core (vorp_core)

    Optional (if detected):
    - RedEM:RP (redem_roleplay)
    - QBR Core (qbr-core)
    - QR Core  (qr-core)
    - Standalone (no framework)

    ═══════════════════════════════════════════════════════════════════════════════

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

fx_version 'cerulean'
game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Resource Metadata
name        'LXR Christmas Experience System'
description '🐺 Multi-framework Christmas experience — wolves.land | The Land of Wolves'
author      'iBoss21 / The Lux Empire'
version     '1.0.0'
url         'https://www.wolves.land'

-- Lua 5.4
lua54 'yes'

dependency 'objectloader'
dependency 'weathersync'

files {
    'xmas.xml',
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}

ui_page 'ui/index.html'

objectloader_map 'xmas.xml'

-- Shared Scripts (loaded on both client and server)
shared_scripts {
    'config.lua',
    'shared/framework.lua'
}

-- Server Scripts
server_scripts {
    'server.lua'
}

-- Client Scripts
client_scripts {
    'client.lua',
    'phonographs.lua',
    'trains.lua'
}
