```lua
-- DXR V2 | Black & Red GUI
-- For a Roblox Studio project you own

loadstring(game:HttpGet("https://scriptblox
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "DXR_V2"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local red = Color3.fromRGB(255, 25, 45)
local black = Color3.fromRGB(12, 12, 14)
local white = Color3.fromRGB(245, 245, 245)

local function addCorner(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

local function addRedBorder(obj, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = red
    stroke.Thickness = thickness
    stroke.Transparency = 0.15
    stroke.Parent = obj
    return stroke
end

-- Main window
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(290, 255)
main.Position = UDim2.new(0.5, -145, 0.5, -127)
main.BackgroundColor3 = black
main.Parent = gui
addCorner(main, 10)
addRedBorder(main, 2)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 42)
title.Position = UDim2.fromOffset(10, 4)
title.BackgroundTransparency = 1
title.Text = "DXR V2"
title.TextColor3 = red
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.Parent = main

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -38, 0, 8)
close.BackgroundColor3 = black
close.Text = "×"
close.TextColor3 = red
close.TextSize = 25
close.Font = Enum.Font.GothamBold
close.Parent = main
addCorner(close, 7)
addRedBorder(close, 1)

-- Feature buttons
local options = {
    "ضبط المسافة",
    "عرض وزن الضب",
    "عرض ندرة الضب"
}

for i, label in ipairs(options) do
    local button = Instance.new("TextButton")
    button.Name = "Option" .. i
    button.Size = UDim2.new(1, -30, 0, 42)
    button.Position = UDim2.fromOffset(15, 55 + (i - 1) * 53)
    button.BackgroundColor3 = Color3.fromRGB(18, 18, 21)
    button.Text = label
    button.TextColor3 = white
    button.TextSize = 15
    button.Font = Enum.Font.GothamMedium
    button.Parent = main
    addCorner(button, 7)

    local border = addRedBorder(button, 1)

    button.MouseButton1Click:Connect(function()
        TweenService:Create(
            border,
            TweenInfo.new(0.15),
            {Transparency = 0}
        ):Play()

        task.delay(0.25, function()
            if border.Parent then
                TweenService:Create(
                    border,
                    TweenInfo.new(0.15),
                    {Transparency = 0.15}
                ):Play()
            end
        end)
    end)
end

-- Floating Dxr toggle
local toggle = Instance.new("TextButton")
toggle.Name = "DxrToggle"
toggle.Size = UDim2.fromOffset(55, 55)
toggle.Position = UDim2.new(0, 18, 0.5, -27)
toggle.BackgroundColor3 = black
toggle.Text = "Dxr"
toggle.TextColor3 = red
toggle.TextSize = 17
toggle.Font = Enum.Font.GothamBold
toggle.Parent = gui
addCorner(toggle, 100)
addRedBorder(toggle, 2)

toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
end)
```
