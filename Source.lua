-- Blox Fruits Multi-Function Script for KRNL
-- Features: AutoFarm, AutoRaid, ESP, Ultra Fast Attack, AutoStore, etc.

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.4, 0, 0.05, 0)
Frame.Position = UDim2.new(0.3, 0, 0.9, 0)
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local function updateHealthBar()
    local player = game.Players.LocalPlayer
    local health = player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 0
    local maxWidth = ScreenGui.AbsoluteSize.X * 0.4
    local newWidth = maxWidth * (health / player.Character.Humanoid.MaxHealth)
    Frame.Size = UDim2.new(newWidth / maxWidth, 0, 0.05, 0)
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Changed:Connect(function(property)
        if property == "Health" then
            updateHealthBar()
        end
    end)
    updateHealthBar()
end)

-- Main Functions
local MainTab = Window:Category("Main Functions")
local FarmSection = MainTab:Sector("AutoFarm")

_G.AutoFarm = false
_G.AutoRaid = false
_G.UltraFastAttack = false

FarmSection:Cheat("Toggle", "Enable AutoFarm", function(State)
    _G.AutoFarm = State
    while _G.AutoFarm do
        wait()
        -- AutoFarm Code Here
    end
end)

FarmSection:Cheat("Toggle", "Enable AutoRaid", function(State)
    _G.AutoRaid = State
    while _G.AutoRaid do
        wait()
        -- AutoRaid Code Here
    end
end)

-- Ultra Fast Attack
local CombatSection = MainTab:Sector("Combat")
CombatSection:Cheat("Toggle", "Enable Ultra Fast Attack", function(State)
    _G.UltraFastAttack = State
    while _G.UltraFastAttack do
        task.spawn(function()
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                game:GetService("VirtualUser"):Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end)
    end
end)

-- ESP & Visuals
local ESPSection = MainTab:Sector("ESP & Visuals")
_G.ESPEnabled = false
ESPSection:Cheat("Toggle", "Enable ESP", function(State)
    _G.ESPEnabled = State
    while _G.ESPEnabled do
        wait()
        -- ESP Code Here
    end
end)

Window:Show()
