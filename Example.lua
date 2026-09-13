local repo = "https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/"
local Library    = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager  = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title        = "TokaiHub",
    Footer       = "v1.0 | longhazem",
    ShowCustomCursor = true,
    NotifySide   = "Right",
})

local Tabs = {
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- ── Combat Tab with millennium-style sub-tabs ──────────────────────────────
local FovPage, GunPage, AimPage = Window:AddTab({
    Name    = "Combat",
    Icon    = "crosshair",
    SubTabs = { "FOV", "Gun Mod", "Aimbot" },
})

-- FOV sub-tab
local FovLeft  = FovPage:AddGroupbox({ Side = "Left",  Name = "Field of View" })
local FovRight = FovPage:AddGroupbox({ Side = "Right", Name = "Display" })

FovLeft:AddToggle("FovEnabled", { Text = "Enable Custom FOV", Default = false, Tag = "NEW" })
FovLeft:AddSlider("FovValue", { Text = "FOV", Default = 70, Min = 10, Max = 120, Rounding = 0 })
FovLeft:AddDropdown("FovType", { Values = {"Default","Viewmodel","World"}, Default = 1, Text = "FOV Type" })
FovRight:AddToggle("FovCircle", { Text = "Show FOV Circle", Default = false })
FovRight:AddLabel({ Text = "FOV Circle Color" }):AddColorPicker("FovColor", { Default = Color3.fromRGB(255, 110, 180) })

-- Gun Mod sub-tab
local GunLeft  = GunPage:AddGroupbox({ Side = "Left",  Name = "Weapon" })
local GunRight = GunPage:AddGroupbox({ Side = "Right", Name = "Visual" })

GunLeft:AddToggle("InfiniteAmmo", { Text = "Infinite Ammo", Default = false, Risky = true, Tag = "HOT" })
GunLeft:AddToggle("NoRecoil",     { Text = "No Recoil",     Default = false })
GunLeft:AddToggle("NoSpread",     { Text = "No Spread",     Default = false })
GunLeft:AddSlider("BulletSpeed",  { Text = "Bullet Speed",  Default = 100, Min = 10, Max = 500, Rounding = 0, Suffix = "%" })
GunRight:AddToggle("Tracer",      { Text = "Bullet Tracer", Default = false })
GunRight:AddLabel({ Text = "Tracer Color" }):AddColorPicker("TracerColor", { Default = Color3.fromRGB(255, 110, 180) })

-- Aimbot sub-tab
local AimLeft  = AimPage:AddGroupbox({ Side = "Left",  Name = "Aimbot" })
local AimRight = AimPage:AddGroupbox({ Side = "Right", Name = "Config" })

AimLeft:AddToggle("AimbotOn",    { Text = "Enable",      Default = false, Tag = "NEW" })
AimLeft:AddSlider("AimbotSmooth",{ Text = "Smoothness",  Default = 5, Min = 1, Max = 20, Rounding = 1 })
AimLeft:AddDropdown("AimbotPart",{ Values = {"Head","Torso","Nearest"}, Default = 1, Text = "Target Part" })
AimLeft:AddToggle("TeamCheck",   { Text = "Team Check",  Default = true })
AimRight:AddToggle("Prediction", { Text = "Prediction",  Default = false })
AimRight:AddSlider("AimFOV",     { Text = "FOV Check",   Default = 90, Min = 10, Max = 360, Rounding = 0 })
AimRight:AddLabel("Aimbot Key"):AddKeyPicker("AimbotKey", { Default = "MB2", Mode = "Hold", Text = "Aimbot Key" })

-- ── Visuals Tab ────────────────────────────────────────────────────────────
local PlayersPage, ZombiesPage, WorldPage = Window:AddTab({
    Name    = "Visuals",
    Icon    = "eye",
    SubTabs = { "Players", "Zombies", "World" },
})

local PLeft  = PlayersPage:AddGroupbox({ Side = "Left",  Name = "Boxes" })
local PRight = PlayersPage:AddGroupbox({ Side = "Right", Name = "Text" })

PLeft:AddDropdown("BoxType",    { Values = {"2D","3D","Corner"}, Default = 2, Text = "Box Type" })
PLeft:AddToggle("BoxEnabled",   { Text = "Box",         Default = true })
PLeft:AddToggle("BoxOutline",   { Text = "Box Outline", Default = true })
PLeft:AddToggle("BoxFill",      { Text = "Box Fill",    Default = false })
PLeft:AddLabel({ Text = "Box Color" }):AddColorPicker("BoxColor", { Default = Color3.fromRGB(255, 110, 180) })
PRight:AddToggle("EspName",     { Text = "Name",        Default = true })
PRight:AddToggle("EspDistance", { Text = "Distance",    Default = false })
PRight:AddToggle("EspHealth",   { Text = "Health Bar",  Default = true })

local ZLeft = ZombiesPage:AddGroupbox({ Side = "Left", Name = "Zombie ESP" })
ZLeft:AddToggle("ZombieESP",  { Text = "Enable",    Default = false })
ZLeft:AddToggle("ZombieBox",  { Text = "Box",       Default = false })
ZLeft:AddToggle("ZombieName", { Text = "Name",      Default = false })

local WLeft = WorldPage:AddGroupbox({ Side = "Left", Name = "World" })
WLeft:AddToggle("ItemESP",    { Text = "Items",     Default = false })
WLeft:AddToggle("VehicleESP", { Text = "Vehicles",  Default = false })
WLeft:AddSlider("ESPDist",    { Text = "Max Distance", Default = 500, Min = 50, Max = 2000, Rounding = 0 })

-- ── Misc Tab ──────────────────────────────────────────────────────────────
local MiscPage = Window:AddTab({ Name = "Misc", Icon = "settings-2", SubTabs = {"General"} })
local MLeft = MiscPage:AddGroupbox({ Side = "Left", Name = "General" })
MLeft:AddToggle("AntiAFK", { Text = "Anti AFK", Default = true })
MLeft:AddToggle("AutoFarm",{ Text = "Auto Farm", Default = false })

-- ── UI Settings ────────────────────────────────────────────────────────────
local MenuGroup = Tabs["UI Settings"]:AddGroupbox({ Side = "Left", Name = "Menu" })
MenuGroup:AddToggle("ShowCursor", { Text = "Custom Cursor", Default = true,
    Callback = function(v) Library.ShowCustomCursor = v end })
MenuGroup:AddButton("Unload", function() Library:Unload() end)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("TokaiHub")
SaveManager:SetFolder("TokaiHub/configs")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
