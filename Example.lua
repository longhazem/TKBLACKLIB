-- ============================================================
--  TOKAIHUB — Example Script
--  Load from: https://github.com/longhazem/TKBLACKLIB
-- ============================================================

local TokaiHub = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/Library.lua"
))()

local SaveManager  = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/SaveManager.lua"
))()

local ThemeManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/ThemeManager.lua"
))()

-- ============================================================
--  Window
-- ============================================================

local Window = TokaiHub:CreateWindow({
    Title             = "TokaiHub",
    Footer            = "v1.0.0",
    ToggleKeybind     = Enum.KeyCode.RightControl,
    Center            = true,
    AutoShow          = true,
    ShowCustomCursor  = true,
    NotifySide        = "Right",
    Resizable         = true,
    MobileButtonsSide = "Left",
})

-- ============================================================
--  Tabs
-- ============================================================

local Tabs = {
    Main     = Window:AddTab("Main",     "home"),
    Visual   = Window:AddTab("Visual",   "eye"),
    Combat   = Window:AddTab("Combat",   "crosshair"),
    Config   = Window:AddTab("Config",   "settings"),
}

-- ============================================================
--  [Main] Left — Features
-- ============================================================

local MainLeftBox = Tabs.Main:AddLeftGroupbox("Features")

-- Toggle with keybind
local AimbotToggle = MainLeftBox:AddToggle("Aimbot", {
    Text     = "Aimbot",
    Default  = false,
    Tooltip  = "Automatically aims at nearest target",
    Callback = function(Value)
        -- handle aimbot toggle
        print("[TokaiHub] Aimbot:", Value)
    end,
})

AimbotToggle:AddKeyPicker("AimbotKey", {
    Default          = "E",
    Mode             = "Hold",
    Text             = "Aimbot",
    SyncToggleState  = false,
    Callback         = function(Value)
        print("[TokaiHub] Aimbot key state:", Value)
    end,
})

-- Dropdown
MainLeftBox:AddDropdown("AimbotPart", {
    Text     = "Target Hitbox",
    Values   = { "Head", "Torso", "LeftLeg", "RightLeg", "Random" },
    Default  = 1,
    Callback = function(Value)
        print("[TokaiHub] Hitbox:", Value)
    end,
})

-- Slider
MainLeftBox:AddSlider("AimbotFOV", {
    Text     = "FOV",
    Default  = 90,
    Min      = 10,
    Max      = 360,
    Rounding = 0,
    Suffix   = "°",
    Callback = function(Value)
        print("[TokaiHub] FOV:", Value)
    end,
})

MainLeftBox:AddSlider("AimbotSmooth", {
    Text     = "Smoothness",
    Default  = 5,
    Min      = 0,
    Max      = 20,
    Rounding = 1,
    Callback = function(Value)
        print("[TokaiHub] Smoothness:", Value)
    end,
})

-- Divider
MainLeftBox:AddDivider()

-- Toggle (risky example)
local SilentToggle = MainLeftBox:AddToggle("SilentAim", {
    Text     = "Silent Aim",
    Default  = false,
    Risky    = true,
    Tooltip  = "Modifies bullet travel direction server-side",
    Callback = function(Value)
        print("[TokaiHub] Silent Aim:", Value)
    end,
})

-- ============================================================
--  [Main] Right — Player
-- ============================================================

local MainRightBox = Tabs.Main:AddRightGroupbox("Player")

local WalkToggle = MainRightBox:AddToggle("WalkSpeed", {
    Text     = "Custom Walk Speed",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] WalkSpeed enabled:", Value)
    end,
})

MainRightBox:AddSlider("WalkSpeedValue", {
    Text     = "Speed",
    Default  = 16,
    Min      = 16,
    Max      = 250,
    Rounding = 0,
    Callback = function(Value)
        if WalkToggle.Value then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local JumpToggle = MainRightBox:AddToggle("JumpPower", {
    Text     = "Custom Jump Power",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] JumpPower enabled:", Value)
    end,
})

MainRightBox:AddSlider("JumpPowerValue", {
    Text     = "Power",
    Default  = 50,
    Min      = 0,
    Max      = 500,
    Rounding = 0,
    Callback = function(Value)
        if JumpToggle.Value then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end,
})

MainRightBox:AddDivider()

MainRightBox:AddButton({
    Text         = "Teleport to Spawn",
    DoubleClick  = false,
    Func         = function()
        local chr = game.Players.LocalPlayer.Character
        if chr then
            chr:MoveTo(workspace.SpawnLocation.Position)
        end
    end,
})

MainRightBox:AddButton({
    Text        = "Kill Local Player",
    Risky       = true,
    DoubleClick = true,
    Tooltip     = "Double-click to confirm",
    Func        = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end,
})

-- ============================================================
--  [Visual] Tabbox — ESP / Chams / Misc
-- ============================================================

local VisualTabbox = Tabs.Visual:AddLeftTabbox("Visual")
local ESPTab       = VisualTabbox:AddTab("ESP")
local ChamsTab     = VisualTabbox:AddTab("Chams")

-- ESP
local ESPToggle = ESPTab:AddToggle("ESP", {
    Text     = "ESP",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] ESP:", Value)
    end,
})

ESPToggle:AddColorPicker("ESPColor", {
    Default      = Color3.fromRGB(255, 110, 180),
    Title        = "ESP Box Color",
    Transparency = 0,
    Callback     = function(Value)
        print("[TokaiHub] ESP Color:", Value)
    end,
})

ESPTab:AddDropdown("ESPOptions", {
    Text    = "ESP Components",
    Values  = { "Boxes", "Names", "Health", "Distance", "Weapon", "Skeleton" },
    Default = { "Boxes", "Names" },
    Multi   = true,
    Callback = function(Values)
        for Component, Active in pairs(Values) do
            if Active then
                print("[TokaiHub] ESP Component:", Component)
            end
        end
    end,
})

ESPTab:AddSlider("ESPDistance", {
    Text     = "Max Distance",
    Default  = 500,
    Min      = 50,
    Max      = 2000,
    Rounding = 0,
    Suffix   = " studs",
    Callback = function(Value)
        print("[TokaiHub] ESP Distance:", Value)
    end,
})

-- Chams
local ChamsToggle = ChamsTab:AddToggle("Chams", {
    Text     = "Chams",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] Chams:", Value)
    end,
})

ChamsToggle:AddColorPicker("ChamsColor", {
    Default      = Color3.fromRGB(255, 110, 180),
    Title        = "Chams Color",
    Transparency = 0.3,
    Callback     = function(Value)
        print("[TokaiHub] Chams Color:", Value)
    end,
})

ChamsTab:AddDropdown("ChamsMaterial", {
    Text     = "Material",
    Values   = { "Neon", "Glass", "Foil", "SmoothPlastic" },
    Default  = 1,
    Callback = function(Value)
        print("[TokaiHub] Chams Material:", Value)
    end,
})

-- Visual Right
local VisualRightBox = Tabs.Visual:AddRightGroupbox("World")

VisualRightBox:AddToggle("Fullbright", {
    Text     = "Fullbright",
    Default  = false,
    Callback = function(Value)
        game.Lighting.Brightness = Value and 2 or 1
        game.Lighting.GlobalShadows = not Value
    end,
})

VisualRightBox:AddSlider("TimeOfDay", {
    Text     = "Time of Day",
    Default  = 14,
    Min      = 0,
    Max      = 24,
    Rounding = 1,
    Suffix   = "h",
    Callback = function(Value)
        game.Lighting.ClockTime = Value
    end,
})

-- ============================================================
--  [Combat] — Aim & Bullet
-- ============================================================

local CombatLeftBox  = Tabs.Combat:AddLeftGroupbox("Aim")
local CombatRightBox = Tabs.Combat:AddRightGroupbox("Bullet")

CombatLeftBox:AddToggle("AimPred", {
    Text     = "Aim Prediction",
    Default  = false,
    Tooltip  = "Predicts target movement",
    Callback = function(Value)
        print("[TokaiHub] Aim Prediction:", Value)
    end,
})

CombatLeftBox:AddSlider("PredStrength", {
    Text     = "Prediction Strength",
    Default  = 1,
    Min      = 0,
    Max      = 5,
    Rounding = 2,
    Callback = function(Value)
        print("[TokaiHub] Prediction:", Value)
    end,
})

CombatLeftBox:AddDropdown("TargetOrder", {
    Text     = "Priority",
    Values   = { "Nearest", "Lowest HP", "Highest HP", "Furthest" },
    Default  = 1,
    Callback = function(Value)
        print("[TokaiHub] Target Priority:", Value)
    end,
})

CombatLeftBox:AddDropdown("TeamCheck", {
    Text     = "Team Filter",
    Values   = { "Enemies Only", "All", "Allies Only" },
    Default  = 1,
    Callback = function(Value)
        print("[TokaiHub] Team Filter:", Value)
    end,
})

CombatRightBox:AddToggle("InfiniteRange", {
    Text     = "Infinite Range",
    Default  = false,
    Risky    = true,
    Callback = function(Value)
        print("[TokaiHub] Infinite Range:", Value)
    end,
})

CombatRightBox:AddToggle("NoRecoil", {
    Text     = "No Recoil",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] No Recoil:", Value)
    end,
})

CombatRightBox:AddToggle("NoSpread", {
    Text     = "No Spread",
    Default  = false,
    Callback = function(Value)
        print("[TokaiHub] No Spread:", Value)
    end,
})

CombatRightBox:AddSlider("BulletVelocity", {
    Text     = "Bullet Velocity",
    Default  = 100,
    Min      = 10,
    Max      = 9999,
    Rounding = 0,
    Suffix   = " m/s",
    Callback = function(Value)
        print("[TokaiHub] Velocity:", Value)
    end,
})

-- ============================================================
--  [Config] — SaveManager / ThemeManager
-- ============================================================

ThemeManager:SetLibrary(TokaiHub)
SaveManager:SetLibrary(TokaiHub)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

ThemeManager:SetFolder("TokaiHubSettings")
SaveManager:SetFolder("TokaiHubSettings/Configs")

ThemeManager:ApplyToTab(Tabs.Config)
SaveManager:BuildConfigSection(Tabs.Config)

-- ============================================================
--  Load default config on start
-- ============================================================

SaveManager:LoadAutoloadConfig()

-- ============================================================
--  Notify ready
-- ============================================================

TokaiHub:Notify({
    Title       = "TokaiHub Loaded",
    Description = "Welcome back. Press Right-Ctrl to toggle.",
    Time        = 4,
})
