<!--
    ██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝         ╚███╔╝ ██╔████╔██║███████║███████╗
    ██║      ██╔██╗ ██╔══██╗         ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
    ███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝

    🐺 LXR Core — Christmas Experience System
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
-->

<div align="center">

```
██╗     ██╗  ██╗██████╗         ██╗  ██╗███╗   ███╗ █████╗ ███████╗
██║     ╚██╗██╔╝██╔══██╗        ╚██╗██╔╝████╗ ████║██╔══██╗██╔════╝
██║      ╚███╔╝ ██████╔╝█████╗   ╚███╔╝ ██╔████╔██║███████║███████╗
██║      ██╔██╗ ██╔══██╗╚════╝   ██╔██╗ ██║╚██╔╝██║██╔══██║╚════██║
███████╗██╔╝ ██╗██║  ██║        ██╔╝ ██╗██║ ╚═╝ ██║██║  ██║███████║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝        ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
```

# 🎄 LXR Christmas Experience System

**🐺 wolves.land — The Land of Wolves | Georgian RP 🇬🇪**

[![RedM](https://img.shields.io/badge/RedM-Resource-red?style=flat-square)](https://redm.net)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat-square)](https://github.com/iboss21/lxr-xmas)
[![License](https://img.shields.io/badge/License-Proprietary-orange?style=flat-square)](https://www.wolves.land)
[![Author](https://img.shields.io/badge/Author-iBoss21-green?style=flat-square)](https://github.com/iboss21)

> *ისტორია ცოცხლდება აქ! — History Lives Here!*

</div>

---

## ═══════════════════════════════════════════════════════════
## 📖 OVERVIEW
## ═══════════════════════════════════════════════════════════

**lxr-xmas** is a production-grade Christmas seasonal experience system for RedM servers.
It provides an immersive holiday atmosphere through festive weather, ambient phonograph music,
and decorated trains — fully configurable and supporting multiple frameworks.

### Features

- 🌨️ **Markov-chain weather system** — realistic, weighted weather transitions (snowlight → snow → blizzard)
- 🎵 **World phonograph music** — distance-attenuated Christmas audio across all major settlements
- 🚂 **Decorated trains** — automatic seasonal ornament attachment to locomotive models
- 🔧 **Multi-framework support** — LXR Core, RSG Core, VORP Core, and more
- 🛡️ **Admin volume command** — `/xmas_vol <0-100>` for live music management
- ⚡ **Performance optimized** — minimal overhead, 100ms phonograph update interval

---

## ═══════════════════════════════════════════════════════════
## 🖥️ SERVER INFORMATION
## ═══════════════════════════════════════════════════════════

| Field       | Value                                                 |
|-------------|-------------------------------------------------------|
| Server      | The Land of Wolves 🐺                                 |
| Tagline     | Georgian RP 🇬🇪 \| მგლების მიწა - რჩეულთა ადგილი!  |
| Type        | Serious Hardcore Roleplay                             |
| Access      | Discord & Whitelisted                                 |
| Developer   | iBoss21 / The Lux Empire                              |
| Website     | https://www.wolves.land                               |
| Discord     | https://discord.gg/CrKcWdfd3A                         |
| GitHub      | https://github.com/iBoss21                            |
| Store       | https://theluxempire.tebex.io                         |
| Server List | https://servers.redm.net/servers/detail/8gj7eb        |

---

## ═══════════════════════════════════════════════════════════
## 🔧 FRAMEWORK SUPPORT
## ═══════════════════════════════════════════════════════════

| Framework       | Status              | Notes                        |
|-----------------|---------------------|------------------------------|
| **LXR Core**    | ✅ Primary          | Full support, auto-detected  |
| **RSG Core**    | ✅ Primary          | Full support, auto-detected  |
| **VORP Core**   | ✅ Supported        | Compatible, auto-detected    |
| RedEM:RP        | ⚡ Optional         | Auto-detected if present     |
| QBR Core        | ⚡ Optional         | Auto-detected if present     |
| QR Core         | ⚡ Optional         | Auto-detected if present     |
| Standalone      | 🔄 Fallback         | No framework required        |

Framework auto-detection follows the priority order above. To override, set `Config.Framework` in `config.lua`.

---

## ═══════════════════════════════════════════════════════════
## 📦 DEPENDENCIES
## ═══════════════════════════════════════════════════════════

| Dependency     | Required | Purpose                          |
|----------------|----------|----------------------------------|
| `objectloader` | ✅ Yes   | Load Christmas world objects     |
| `weathersync`  | ✅ Yes   | Manage RedM weather patterns     |

---

## ═══════════════════════════════════════════════════════════
## 🚀 INSTALLATION
## ═══════════════════════════════════════════════════════════

1. **Download** and place the `lxr-xmas` folder in your server's `resources` directory.

2. **Ensure dependencies** are installed and started before `lxr-xmas`:
   ```
   ensure objectloader
   ensure weathersync
   ensure lxr-xmas
   ```

3. **Configure** `config.lua` to match your server preferences.

4. **Grant the volume command** via ACE permissions (or your framework's system):
   ```
   add_ace group.admin command.xmas_vol allow
   ```

> ⚠️ **Important:** The resource folder **must** be named `lxr-xmas`. A runtime guard will throw an error if the name is incorrect.

---

## ═══════════════════════════════════════════════════════════
## ⚙️ CONFIGURATION
## ═══════════════════════════════════════════════════════════

All settings are in `config.lua`. Key sections:

### Framework
```lua
Config.Framework = 'auto'  -- 'auto', 'lxr-core', 'rsg-core', 'vorp_core', 'standalone'
```

### Music
```lua
Config.Music = {
    streamUrl         = 'https://redm.khzae.net/xmas1.ogg',
    attenuationFactor = 8.0,   -- Volume drop rate with distance
    defaultVolume     = 50,    -- Default volume (0-100)
    loop              = true
}
```

### Phonograph Locations
Add or remove `vector3(x, y, z)` entries in `Config.Phonographs` to control where
music plays. Pre-configured for: Sisika, Valentine, Strawberry, Blackwater, Rhodes,
Van Horn, Saint Denis (×2), Armadillo, Tumbleweed, Annesburg.

### Weather
```lua
Config.Weather = {
    initialWeather  = 'snowlight',
    transitionTime  = 10.0,
    thunder         = true,
    patterns        = { ... }  -- Markov-chain transition weights
}
```

### Train Decorations
```lua
Config.Trains = {
    trainModels    = { 'northsteamer01x' },
    decorationProp = 'mp006_p_veh_xmasnsteamer01x'
}
```

---

## ═══════════════════════════════════════════════════════════
## 🎮 COMMANDS
## ═══════════════════════════════════════════════════════════

| Command              | Permission | Description                          |
|----------------------|------------|--------------------------------------|
| `/xmas_vol <0-100>`  | Admin      | Set Christmas music volume for a player |

---

## ═══════════════════════════════════════════════════════════
## 📁 FILE STRUCTURE
## ═══════════════════════════════════════════════════════════

```
lxr-xmas/
├── fxmanifest.lua       — Resource manifest (cerulean, lua54)
├── config.lua           — Main configuration (shared)
├── server.lua           — Weather sync + volume command
├── client.lua           — NUI volume callbacks
├── phonographs.lua      — Distance-based audio engine
├── trains.lua           — Train decoration engine
├── xmas.xml             — World object map
├── shared/
│   └── framework.lua    — Multi-framework adapter layer
└── ui/
    ├── index.html       — NUI audio player
    ├── script.js        — Volume attenuation logic
    └── style.css        — Transparent UI overlay
```

---

## ═══════════════════════════════════════════════════════════
## 📜 CREDITS
## ═══════════════════════════════════════════════════════════

| Role               | Credit                                    |
|--------------------|-------------------------------------------|
| Script Author      | iBoss21 / The Lux Empire                  |
| Original Concept   | nzkfc                                     |
| Inspiration        | Seasonal immersion & holiday RP atmosphere |
| Server             | The Land of Wolves — wolves.land          |

---

## ═══════════════════════════════════════════════════════════
## ⚖️ LICENSE
## ═══════════════════════════════════════════════════════════

© 2026 **iBoss21 / The Lux Empire** | [wolves.land](https://www.wolves.land) | All Rights Reserved.

This resource is proprietary software. Redistribution, resale, or use outside of the
licensed server without explicit written permission from iBoss21 is strictly prohibited.

---

<div align="center">

**🐺 The Land of Wolves — Georgian RP 🇬🇪**

[Website](https://www.wolves.land) • [Discord](https://discord.gg/CrKcWdfd3A) • [GitHub](https://github.com/iBoss21) • [Store](https://theluxempire.tebex.io)

*მგლების მიწა - რჩეულთა ადგილი!*

</div>
