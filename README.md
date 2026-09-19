# TOKAIHUB UI Library

A clean, customizable Roblox UI library — rebranded and maintained by **longhazem**.

Default theme: **Sakura** — deep rose background, hot pink accent, soft blush font.

---

## Table of Contents

- [Getting Started](#getting-started)
- [Icon Information](#icon-information)
- [Core Components](#core-components)
  - [Window](#window)
  - [Tabs](#tabs)
  - [Groupboxes](#groupboxes)
  - [Tabboxes](#tabboxes)
- [UI Elements](#ui-elements)
  - [Labels](#labels)
  - [Buttons](#buttons)
  - [Toggles & Checkboxes](#toggles--checkboxes)
  - [Inputs](#inputs)
  - [Sliders](#sliders)
  - [Dropdowns](#dropdowns)
  - [Keybinds](#keybinds)
  - [Color Pickers](#color-pickers)
  - [Dividers](#dividers)
- [Additional Features](#additional-features)
  - [Notifications](#notifications)
  - [Tooltips](#tooltips)
  - [Keybind Menu](#keybind-menu)
  - [Custom Cursor](#custom-cursor)
  - [Mobile Support](#mobile-support)
- [Theming](#theming)
- [API Reference](#api-reference)
- [Examples](#examples)

---

## Getting Started

To use the TOKAIHUB UI Library, load it with:

```lua
local TokaiHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/Library.lua"))()
```

Then create a window:

```lua
local Window = TokaiHub:CreateWindow({
    Title = "TokaiHub",
    Footer = "v1.0.0",
    ToggleKeybind = Enum.KeyCode.RightControl,
    Center = true,
    AutoShow = true
})
```

### Addons

```lua
local SaveManager  = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/SaveManager.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/addons/ThemeManager.lua"))()

ThemeManager:SetLibrary(TokaiHub)
SaveManager:SetLibrary(TokaiHub)
```

---

## Icon Information

TOKAIHUB uses [Lucide](https://lucide.dev/) for Tab Icons and more.

---

## Core Components

### Window

The Window is the main container for your UI. Create one using `TokaiHub:CreateWindow()`.

#### Options

| Property          | Type         | Default                    | Description                                        |
| ----------------- | ------------ | -------------------------- | -------------------------------------------------- |
| Title             | string       | "No Title"                 | The title displayed at the top of the window       |
| Footer            | string       | "No Footer"                | The text displayed at the bottom of the window     |
| Position          | UDim2        | UDim2.fromOffset(6, 6)     | The initial position of the window                 |
| Size              | UDim2        | UDim2.fromOffset(720, 600) | The size of the window                             |
| Center            | boolean      | true                       | Whether to center the window on the screen         |
| AutoShow          | boolean      | true                       | Whether to show the window immediately             |
| ToggleKeybind     | Enum.KeyCode | Enum.KeyCode.RightControl  | The keybind to toggle the UI                       |
| NotifySide        | string       | "Right"                    | The side to show notifications ("Left" or "Right") |
| ShowCustomCursor  | boolean      | true                       | Whether to show a custom cursor                    |
| Font              | Enum.Font    | Enum.Font.Code             | The font to use for text                           |
| CornerRadius      | number       | 4                          | The corner radius for UI elements                  |
| Icon              | string/ID    | nil                        | Optional icon for the window                       |
| IconSize          | UDim2        | UDim2.fromOffset(30, 30)   | Size of the icon if provided                       |
| Resizable         | boolean      | true                       | Whether the window can be resized                  |
| MobileButtonsSide | string       | "Left"                     | Side to place mobile buttons ("Left" or "Right")   |

---

### Tabs

Tabs are the primary way to organize content in your UI.

```lua
local MainTab = Window:AddTab("Main", "home") -- Second parameter is the icon name (optional)
```

#### Methods

| Method                                                                            | Description                                          |
| --------------------------------------------------------------------------------- | ---------------------------------------------------- |
| `Window:AddTab(name, icon)`                                                       | Adds a new tab with the given name and optional icon |
| `Window:AddKeyTab(name)`                                                          | Adds a special tab for key input                     |
| `Tab:UpdateWarningBox({Title = "Warning", Text = "Example", Visible = true})`    | Updates the warning box in a tab                     |

---

### Groupboxes

Groupboxes are containers for UI elements within tabs.

```lua
local LeftGroupbox  = MainTab:AddLeftGroupbox("Settings")
local RightGroupbox = MainTab:AddRightGroupbox("Information")
```

#### Methods

| Method                       | Description                                   |
| ---------------------------- | --------------------------------------------- |
| `Tab:AddLeftGroupbox(name)`  | Adds a groupbox on the left side              |
| `Tab:AddRightGroupbox(name)` | Adds a groupbox on the right side             |
| `Groupbox:Resize()`          | Manually resizes the groupbox (rarely needed) |

---

### Tabboxes

Tabboxes are containers that can have their own tabs.

```lua
local Tabbox = MainTab:AddLeftTabbox("Settings")
local Tab1   = Tabbox:AddTab("General")
local Tab2   = Tabbox:AddTab("Advanced")
```

#### Methods

| Method                     | Description                     |
| -------------------------- | ------------------------------- |
| `Tab:AddLeftTabbox(name)`  | Adds a tabbox on the left side  |
| `Tab:AddRightTabbox(name)` | Adds a tabbox on the right side |
| `Tabbox:AddTab(name)`      | Adds a new tab to the tabbox    |

---

## UI Elements

### Labels

```lua
local Label = Groupbox:AddLabel("This is a label")
local WrappedLabel = Groupbox:AddLabel({
    Text = "This is a wrapped label that will break into multiple lines",
    DoesWrap = true
})
```

#### Methods

| Method                      | Description              |
| --------------------------- | ------------------------ |
| `Label:SetText(text)`       | Updates the label's text |
| `Label:SetVisible(boolean)` | Shows or hides the label |

---

### Buttons

```lua
local Button = Groupbox:AddButton({
    Text = "Click Me",
    Func = function()
        print("Button clicked!")
    end,
    DoubleClick = true
})

Button:AddButton({
    Text = "Sub Button",
    Func = function()
        print("Sub-button clicked!")
    end
})
```

#### Options

| Property        | Type     | Default        | Description                                   |
| --------------- | -------- | -------------- | --------------------------------------------- |
| Text            | string   | "Button"       | The button's text                             |
| Func            | function | function() end | The function to call when clicked             |
| DoubleClick     | boolean  | false          | Whether the button needs double-click         |
| Tooltip         | string   | nil            | Tooltip text shown on hover                   |
| DisabledTooltip | string   | nil            | Tooltip shown when disabled                   |
| Risky           | boolean  | false          | Displays text in red to indicate risky action |
| Disabled        | boolean  | false          | Whether the button is disabled                |
| Visible         | boolean  | true           | Whether the button is visible                 |

#### Methods

| Method                        | Description                    |
| ----------------------------- | ------------------------------ |
| `Button:SetText(text)`        | Updates the button's text      |
| `Button:SetDisabled(boolean)` | Enables or disables the button |
| `Button:SetVisible(boolean)`  | Shows or hides the button      |

---

### Toggles & Checkboxes

```lua
local MyToggle = Groupbox:AddToggle("MyToggle", {
    Text = "Example Toggle",
    Default = false,
    Tooltip = "This is a toggle",
    Callback = function(Value)
        print("Toggle changed to:", Value)
    end
})

MyToggle:OnChanged(function(Value)
    print("Toggle changed via OnChanged:", Value)
end)

local MyCheckbox = Groupbox:AddCheckbox("MyCheckbox", {
    Text = "Example Checkbox",
    Default = false,
    Callback = function(Value)
        print("Checkbox changed to:", Value)
    end
})
```

#### Options

| Property        | Type     | Default        | Description                                   |
| --------------- | -------- | -------------- | --------------------------------------------- |
| Text            | string   | "Toggle"       | The toggle's text                             |
| Default         | boolean  | false          | The initial state                             |
| Tooltip         | string   | nil            | Tooltip text shown on hover                   |
| DisabledTooltip | string   | nil            | Tooltip shown when disabled                   |
| Callback        | function | function() end | Called when the toggle changes                |
| Risky           | boolean  | false          | Displays text in red to indicate risky action |
| Disabled        | boolean  | false          | Whether the toggle is disabled                |
| Visible         | boolean  | true           | Whether the toggle is visible                 |

#### Methods

| Method                        | Description                    |
| ----------------------------- | ------------------------------ |
| `Toggle:SetValue(boolean)`    | Sets the toggle value          |
| `Toggle:SetText(text)`        | Updates the toggle's text      |
| `Toggle:SetDisabled(boolean)` | Enables or disables the toggle |
| `Toggle:SetVisible(boolean)`  | Shows or hides the toggle      |
| `Toggle:OnChanged(function)`  | Adds another callback function |

---

### Inputs

```lua
local Input = Groupbox:AddInput("MyInput", {
    Text = "Input Example",
    Default = "Default value",
    Numeric = false,
    Finished = true,
    Placeholder = "Enter text here...",
    Callback = function(Value)
        print("Input updated:", Value)
    end
})
```

#### Options

| Property         | Type     | Default        | Description                                             |
| ---------------- | -------- | -------------- | ------------------------------------------------------- |
| Text             | string   | "Input"        | The input's label text                                  |
| Default          | string   | ""             | The initial value                                       |
| Numeric          | boolean  | false          | Whether to allow only numeric input                     |
| Finished         | boolean  | false          | Whether to call the callback only when Enter is pressed |
| ClearTextOnFocus | boolean  | true           | Whether to clear the text when focused                  |
| Placeholder      | string   | ""             | Placeholder text when empty                             |
| AllowEmpty       | boolean  | true           | Whether to allow empty input                            |
| EmptyReset       | string   | "---"          | Value to use when empty if AllowEmpty is false          |
| MaxLength        | number   | nil            | Maximum character length                                |
| Tooltip          | string   | nil            | Tooltip text shown on hover                             |
| DisabledTooltip  | string   | nil            | Tooltip shown when disabled                             |
| Callback         | function | function() end | Called when the input changes                           |
| Disabled         | boolean  | false          | Whether the input is disabled                           |
| Visible          | boolean  | true           | Whether the input is visible                            |

#### Methods

| Method                       | Description                    |
| ---------------------------- | ------------------------------ |
| `Input:SetValue(text)`       | Sets the input value           |
| `Input:SetText(text)`        | Updates the input's label text |
| `Input:SetDisabled(boolean)` | Enables or disables the input  |
| `Input:SetVisible(boolean)`  | Shows or hides the input       |
| `Input:OnChanged(function)`  | Adds another callback function |

---

### Sliders

```lua
local Slider = Groupbox:AddSlider("MySlider", {
    Text = "Example Slider",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        print("Slider changed to:", Value)
    end
})
```

#### Options

| Property        | Type     | Default        | Description                              |
| --------------- | -------- | -------------- | ---------------------------------------- |
| Text            | string   | "Slider"       | The slider's text                        |
| Default         | number   | 0              | The initial value                        |
| Min             | number   | 0              | The minimum value                        |
| Max             | number   | 100            | The maximum value                        |
| Rounding        | number   | 0              | Decimal places to round to               |
| Compact         | boolean  | false          | Whether to use compact mode              |
| HideMax         | boolean  | false          | Whether to hide the max value in display |
| Prefix          | string   | ""             | Text before the value                    |
| Suffix          | string   | ""             | Text after the value                     |
| Tooltip         | string   | nil            | Tooltip text shown on hover              |
| DisabledTooltip | string   | nil            | Tooltip shown when disabled              |
| Callback        | function | function() end | Called when the slider changes           |
| Disabled        | boolean  | false          | Whether the slider is disabled           |
| Visible         | boolean  | true           | Whether the slider is visible            |

#### Methods

| Method                        | Description                    |
| ----------------------------- | ------------------------------ |
| `Slider:SetValue(number)`     | Sets the slider value          |
| `Slider:SetText(text)`        | Updates the slider's text      |
| `Slider:SetMin(number)`       | Sets the minimum value         |
| `Slider:SetMax(number)`       | Sets the maximum value         |
| `Slider:SetDisabled(boolean)` | Enables or disables the slider |
| `Slider:SetVisible(boolean)`  | Shows or hides the slider      |
| `Slider:SetPrefix(text)`      | Sets the prefix text           |
| `Slider:SetSuffix(text)`      | Sets the suffix text           |
| `Slider:OnChanged(function)`  | Adds another callback function |

---

### Dropdowns

```lua
local Dropdown = Groupbox:AddDropdown("MyDropdown", {
    Values = {"Option 1", "Option 2", "Option 3"},
    Default = 1,
    Multi = false,
    Text = "Example Dropdown",
    Tooltip = "This is a dropdown",
    Callback = function(Value)
        print("Dropdown new value:", Value)
    end
})

local MultiDropdown = Groupbox:AddDropdown("MyMultiDropdown", {
    Values = {"Option A", "Option B", "Option C"},
    Default = {"Option A"},
    Multi = true,
    Text = "Multi-Select Example",
    Callback = function(Values)
        for Value, Selected in pairs(Values) do
            if Selected then
                print("Selected:", Value)
            end
        end
    end
})
```

#### Special Dropdowns

```lua
local PlayerDropdown = Groupbox:AddDropdown("PlayerDropdown", {
    SpecialType = "Player",
    Text = "Select Players",
    Multi = true,
    ExcludeLocalPlayer = true
})

local TeamDropdown = Groupbox:AddDropdown("TeamDropdown", {
    SpecialType = "Team",
    Text = "Select Team"
})
```

#### Options

| Property                | Type      | Default        | Description                                       |
| ----------------------- | --------- | -------------- | ------------------------------------------------- |
| Text                    | string    | nil            | The dropdown's label text                         |
| Values                  | table     | {}             | List of selectable values                         |
| Default                 | any/table | nil            | Default selected value or values for multi-select |
| Multi                   | boolean   | false          | Whether multiple values can be selected           |
| AllowNull               | boolean   | false          | Whether no selection is allowed                   |
| Searchable              | boolean   | false          | Whether to allow searching in dropdown            |
| MaxVisibleDropdownItems | number    | 8              | Maximum number of visible items                   |
| SpecialType             | string    | nil            | Special types: "Player" or "Team"                 |
| ExcludeLocalPlayer      | boolean   | false          | For Player type, excludes local player            |
| FormatDisplayValue      | function  | nil            | Function to format displayed values               |
| DisabledValues          | table     | {}             | Values that cannot be selected                    |
| Tooltip                 | string    | nil            | Tooltip text shown on hover                       |
| DisabledTooltip         | string    | nil            | Tooltip shown when disabled                       |
| Callback                | function  | function() end | Called when selection changes                     |
| Disabled                | boolean   | false          | Whether the dropdown is disabled                  |
| Visible                 | boolean   | true           | Whether the dropdown is visible                   |

#### Methods

| Method                                    | Description                       |
| ----------------------------------------- | --------------------------------- |
| `Dropdown:SetValue(value)`                | Sets the selected value(s)        |
| `Dropdown:SetValues(table)`               | Replaces all dropdown values      |
| `Dropdown:AddValues(value/table)`         | Adds new values to the dropdown   |
| `Dropdown:SetDisabledValues(table)`       | Sets which values are disabled    |
| `Dropdown:AddDisabledValues(value/table)` | Adds values to disabled list      |
| `Dropdown:SetText(text)`                  | Updates the dropdown's label text |
| `Dropdown:SetDisabled(boolean)`           | Enables or disables the dropdown  |
| `Dropdown:SetVisible(boolean)`            | Shows or hides the dropdown       |
| `Dropdown:OnChanged(function)`            | Adds another callback function    |

---

### Keybinds

```lua
local MyToggle = Groupbox:AddToggle("MyToggle", {
    Text = "Example Toggle",
    Default = false
})

local Keybind = MyToggle:AddKeyPicker("MyKeybind", {
    Default = "F",
    Text = "Example Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        print("Keybind pressed, value:", Value)
    end
})
```

#### Options

| Property        | Type     | Default                      | Description                                 |
| --------------- | -------- | ---------------------------- | ------------------------------------------- |
| Text            | string   | "KeyPicker"                  | The keybind's text                          |
| Default         | string   | "None"                       | The initial key                             |
| Mode            | string   | "Toggle"                     | Operation mode ("Toggle", "Hold", "Always") |
| SyncToggleState | boolean  | false                        | Whether to sync with parent toggle          |
| Modes           | table    | {"Always", "Toggle", "Hold"} | Available modes                             |
| NoUI            | boolean  | false                        | Whether to hide from keybind menu           |
| Callback        | function | function() end               | Called when keybind state changes           |
| ChangedCallback | function | function() end               | Called when key is changed                  |
| Clicked         | function | function() end               | Called when clicked                         |

#### Methods

| Method                          | Description                        |
| ------------------------------- | ---------------------------------- |
| `Keybind:SetValue({key, mode})` | Sets the key and mode              |
| `Keybind:GetState()`            | Returns current state (true/false) |
| `Keybind:SetText(text)`         | Updates the keybind's text         |
| `Keybind:Update()`              | Updates the keybind display        |
| `Keybind:OnClick(function)`     | Sets the click callback            |
| `Keybind:OnChanged(function)`   | Sets the change callback           |

---

### Color Pickers

```lua
local MyToggle = Groupbox:AddToggle("MyToggle", {
    Text = "Example Toggle",
    Default = false
})

local ColorPicker = MyToggle:AddColorPicker("MyColorPicker", {
    Default = Color3.fromRGB(255, 110, 180),
    Title = "Select Color",
    Transparency = 0,
    Callback = function(Value)
        print("Color changed to:", Value)
    end
})
```

#### Options

| Property     | Type     | Default             | Description                |
| ------------ | -------- | ------------------- | -------------------------- |
| Default      | Color3   | Color3.new(1, 1, 1) | The initial color          |
| Title        | string   | nil                 | Title shown in picker      |
| Transparency | number   | 0                   | Default transparency (0-1) |
| Callback     | function | function() end      | Called when color changes  |
| Changed      | function | function() end      | Alternative callback       |

#### Methods

| Method                                         | Description                     |
| ---------------------------------------------- | ------------------------------- |
| `ColorPicker:SetValue(hsv, transparency)`      | Sets HSV color and transparency |
| `ColorPicker:SetValueRGB(color, transparency)` | Sets RGB color and transparency |
| `ColorPicker:OnChanged(function)`              | Sets the change callback        |

---

### Dividers

```lua
Groupbox:AddDivider()
```

---

## Additional Features

### Notifications

```lua
TokaiHub:Notify("This is a notification", 5)

TokaiHub:Notify({
    Title = "Success",
    Description = "Operation completed successfully",
    Time = 5,
    SoundId = 123456789
})

local Notification = TokaiHub:Notify({
    Title = "Progress",
    Description = "Processing...",
    Time = 10
})

Notification:ChangeTitle("Almost done")
Notification:ChangeDescription("Finalizing...")

local StepNotification = TokaiHub:Notify({
    Title = "Progress",
    Description = "Downloading files...",
    Steps = 5,
    Time = someInstanceThatFires
})

StepNotification:ChangeStep(2)
```

### Tooltips

```lua
local Button = Groupbox:AddButton({
    Text = "Help",
    Tooltip = "Click for assistance",
    DisabledTooltip = "Currently unavailable"
})

local TooltipObject = TokaiHub:AddTooltip("Normal info", "Disabled info", someGuiElement)
```

### Keybind Menu

```lua
TokaiHub.ShowToggleFrameInKeybinds = true
```

### Custom Cursor

```lua
TokaiHub.ShowCustomCursor = true
```

### Mobile Support

```lua
if TokaiHub.IsMobile then
    -- Adjust your UI accordingly
end

Window = TokaiHub:CreateWindow({
    MobileButtonsSide = "Right"
})
```

---

## Theming

TOKAIHUB ships with the **Sakura** theme as default:

```lua
TokaiHub.Scheme = {
    BackgroundColor = Color3.fromRGB(42, 15, 31),   -- #2a0f1f
    MainColor       = Color3.fromRGB(61, 26, 46),   -- #3d1a2e
    AccentColor     = Color3.fromRGB(255, 110, 180), -- #ff6eb4 (hot pink)
    OutlineColor    = Color3.fromRGB(107, 45, 78),  -- #6b2d4e
    FontColor       = Color3.fromRGB(255, 240, 245), -- #fff0f5
    Font            = Font.fromEnum(Enum.Font.Gotham),
}

TokaiHub:SetFont(Enum.Font.Gotham)
TokaiHub:SetDPIScale(150)
```

Config folder: `TokaiHubSettings/` in your executor workspace.

---

## API Reference

### Library Functions

| Function                                                    | Description                             |
| ----------------------------------------------------------- | --------------------------------------- |
| `TokaiHub:CreateWindow(options)`                            | Creates a new window                    |
| `TokaiHub:Notify(message, duration, soundId)`               | Shows a notification                    |
| `TokaiHub:SetFont(font)`                                    | Sets the global font                    |
| `TokaiHub:SetNotifySide(side)`                              | Sets which side notifications appear on |
| `TokaiHub:SetDPIScale(scale)`                               | Sets the UI scaling (100 = 100%)        |
| `TokaiHub:Toggle(visible)`                                  | Shows or hides the entire UI            |
| `TokaiHub:AddTooltip(tooltip, disabledTooltip, element)`    | Adds a tooltip to an element            |
| `TokaiHub:AddDraggableButton(text, callback)`               | Creates a draggable button              |
| `TokaiHub:AddDraggableMenu(name)`                           | Creates a draggable menu                |
| `TokaiHub:OnUnload(callback)`                               | Sets a function to call when unloaded   |
| `TokaiHub:Unload()`                                         | Destroys the UI completely              |

### Global References

| Variable                               | Description                                          |
| -------------------------------------- | ---------------------------------------------------- |
| `TokaiHub.Toggled`                     | Whether the UI is currently visible                  |
| `TokaiHub.IsMobile`                    | Whether the user is on a mobile device               |
| `TokaiHub.CornerRadius`                | The corner radius used throughout the UI             |
| `TokaiHub.NotifySide`                  | Which side notifications appear on                   |
| `TokaiHub.ShowCustomCursor`            | Whether to show the custom cursor                    |
| `TokaiHub.ForceCheckbox`               | Whether to always use checkboxes instead of switches |
| `TokaiHub.ShowToggleFrameInKeybinds`   | Whether to show toggle state in keybind menu         |
| `TokaiHub.NotifyOnError`               | Whether to show notifications for errors             |
| `TokaiHub.ToggleKeybind`               | The keybind to toggle the UI                         |

---

## Examples

### Basic Window

```lua
local TokaiHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/Library.lua"))()

local Window = TokaiHub:CreateWindow({
    Title = "TokaiHub",
    Footer = "v1.0.0",
    Center = true,
    AutoShow = true
})

local MainTab     = Window:AddTab("Main", "home")
local SettingsTab = Window:AddTab("Settings", "settings")

local LeftGroupbox = MainTab:AddLeftGroupbox("Features")

local MyToggle = LeftGroupbox:AddToggle("MyToggle", {
    Text = "Enable Feature",
    Default = false,
    Tooltip = "Enables the main feature",
    Callback = function(Value)
        print("Feature enabled:", Value)
    end
})

local MyButton = LeftGroupbox:AddButton({
    Text = "Run Action",
    Func = function()
        print("Action running!")
    end
})

local MySlider = LeftGroupbox:AddSlider("MySlider", {
    Text = "Speed",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})

local MyDropdown = LeftGroupbox:AddDropdown("MyDropdown", {
    Values = {"Option 1", "Option 2", "Option 3"},
    Default = 1,
    Text = "Select Option",
    Callback = function(Value)
        print("Selected:", Value)
    end
})

local RightGroupbox = MainTab:AddRightGroupbox("Information")
RightGroupbox:AddLabel("Welcome to TokaiHub!")

local MyTabbox  = SettingsTab:AddLeftTabbox("Settings")
local ConfigTab = MyTabbox:AddTab("Config")
local ThemeTab  = MyTabbox:AddTab("Theme")

ConfigTab:AddButton({
    Text = "Save Config",
    Func = function()
        TokaiHub:Notify("Config saved!")
    end
})

local ToggleWithKeybind = LeftGroupbox:AddToggle("ToggleWithKey", {
    Text = "Toggle with Keybind",
    Default = false,
    Callback = function(Value)
        print("Toggled:", Value)
    end
})

ToggleWithKeybind:AddKeyPicker("MyKeybind", {
    Default = "G",
    Mode = "Toggle",
    Text = "Toggle Feature",
    SyncToggleState = true,
})

ToggleWithKeybind:AddColorPicker("MyColorPicker", {
    Default = Color3.fromRGB(255, 110, 180),
    Title = "UI Color",
    Callback = function(Value)
        TokaiHub.Scheme.AccentColor = Value
        TokaiHub:UpdateColorsUsingRegistry()
    end
})
```

### Advanced Example with Tabboxes

```lua
local TokaiHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/longhazem/TKBLACKLIB/refs/heads/main/Library.lua"))()

local Window = TokaiHub:CreateWindow({
    Title = "TokaiHub — Advanced",
    Size = UDim2.fromOffset(550, 480),
    Center = true
})

local MainTab   = Window:AddTab("Main")
local ConfigTab = Window:AddTab("Config")

local FeaturesBox  = MainTab:AddLeftTabbox("Features")
local GeneralTab   = FeaturesBox:AddTab("General")
local CombatTab    = FeaturesBox:AddTab("Combat")
local VisualsTab   = FeaturesBox:AddTab("Visuals")

local WalkSpeedToggle = GeneralTab:AddToggle("WalkSpeed", {
    Text = "Custom Walk Speed",
    Default = false,
    Callback = function(Value)
        print("Walk Speed enabled:", Value)
    end
})

local SpeedSlider = GeneralTab:AddSlider("SpeedValue", {
    Text = "Speed Value",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})

local AimbotToggle = CombatTab:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Tooltip = "Automatically aims at enemies",
    Callback = function(Value)
        print("Aimbot enabled:", Value)
    end
})

AimbotToggle:AddKeyPicker("AimbotKey", {
    Default = "E",
    Mode = "Hold",
    Text = "Aimbot",
    Callback = function(Value)
        print("Aimbot key held:", Value)
    end
})

local TargetDropdown = CombatTab:AddDropdown("AimbotTarget", {
    Text = "Target",
    Values = {"Head", "Torso", "Random"},
    Default = 1,
    Callback = function(Value)
        print("Aimbot targeting:", Value)
    end
})

local ESPToggle = VisualsTab:AddToggle("ESP", {
    Text = "ESP",
    Default = false,
    Callback = function(Value)
        print("ESP enabled:", Value)
    end
})

ESPToggle:AddColorPicker("ESPColor", {
    Default = Color3.fromRGB(255, 110, 180),
    Title = "ESP Color",
    Callback = function(Value)
        print("ESP color set to:", Value)
    end
})

local ESPOptions = VisualsTab:AddDropdown("ESPOptions", {
    Text = "ESP Options",
    Values = {"Boxes", "Names", "Health", "Distance"},
    Multi = true,
    Default = {"Boxes", "Names"},
    Callback = function(Values)
        for Option, Enabled in pairs(Values) do
            if Enabled then
                print("ESP option enabled:", Option)
            end
        end
    end
})

local SaveBox = ConfigTab:AddLeftGroupbox("Save Configuration")

local ConfigNameInput = SaveBox:AddInput("ConfigName", {
    Text = "Config Name",
    Default = "MyConfig",
    Placeholder = "Enter name...",
    Finished = true
})

SaveBox:AddButton({
    Text = "Save Config",
    Func = function()
        local name = Options.ConfigName.Value
        TokaiHub:Notify({
            Title = "Config Saved",
            Description = "Saved configuration as " .. name,
            Time = 3
        })
    end
})

SaveBox:AddButton({
    Text = "Load Config",
    Func = function()
        local name = Options.ConfigName.Value
        TokaiHub:Notify({
            Title = "Config Loaded",
            Description = "Loaded configuration " .. name,
            Time = 3
        })
    end
})

local PlayerBox      = MainTab:AddRightGroupbox("Players")
local PlayerSelector = PlayerBox:AddDropdown("PlayerList", {
    SpecialType = "Player",
    Text = "Select Player",
    Tooltip = "Select a player to target",
    Callback = function(Value)
        print("Selected player:", Value)
    end
})

local ThemeBox = ConfigTab:AddRightGroupbox("UI Settings")

local ThemeToggle = ThemeBox:AddToggle("CustomTheme", {
    Text = "Custom Theme",
    Default = false,
    Callback = function(Value)
        print("Custom theme enabled:", Value)
    end
})

local UIScaleSlider = ThemeBox:AddSlider("UIScale", {
    Text = "UI Scale",
    Default = 100,
    Min = 75,
    Max = 150,
    Rounding = 0,
    Suffix = "%",
    Callback = function(Value)
        TokaiHub:SetDPIScale(Value)
    end
})

ThemeBox:AddLabel("Press Right-Ctrl to toggle the UI")

TokaiHub:Toggle(true)
```

---

## Credits

Built on [Obsidian](https://github.com/deividcomsono/Obsidian) by deividcomsono. Rebranded and maintained by [longhazem](https://github.com/longhazem).
