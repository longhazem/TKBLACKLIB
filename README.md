# TokaiHub

A clean, customizable Roblox UI library — forked and rebranded from Obsidian.

Default theme: **Sakura** — deep rose background, hot pink accent, soft blush font.

## Quick Start

```lua
local TokaiHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/Library.lua"))()

local Window = TokaiHub:CreateWindow({
    Title = "TokaiHub",
    -- ...
})
```

## Addons

```lua
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/SaveManager.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/ThemeManager.lua"))()

ThemeManager:SetLibrary(TokaiHub)
SaveManager:SetLibrary(TokaiHub)
```

## Themes

Includes all original themes plus **Sakura** — TokaiHub's signature theme:
- Background: `#2a0f1f`
- Main: `#3d1a2e`
- Accent: `#ff6eb4`
- Outline: `#6b2d4e`
- Font: `#fff0f5`

## Settings

Configs save to `TokaiHubSettings/` in your executor workspace.

## Credits

Built on [Obsidian](https://github.com/deividcomsono/Obsidian) by deividcomsono.
