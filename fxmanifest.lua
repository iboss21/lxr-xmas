--[[
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core - Christmas Experience System
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

fx_version 'adamant'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name        'lxr-xmas'
description '🐺 LXR Christmas Experience System — wolves.land | The Land of Wolves'
author      'iBoss21 / The Lux Empire'
version     '1.0.0'
url         'https://www.wolves.land'

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

shared_script 'config.lua'
server_script  'server.lua'
client_script  'client.lua'
client_script  'phonographs.lua'
client_script  'trains.lua'
