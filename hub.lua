local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotHub"
gui.Parent = player.PlayerGui

-- MAIN WINDOW
local main = Instance.new("Frame")
main.Size = UDim2.new(0,500,0,300)
main.Position = UDim2.new(0.5,-250,0.5,-150)
main.BackgroundColor3 = Color3.fromRGB(22,22,22)
main.Active = true
main.Draggable = true
main.Parent = gui

-- TOP BAR
local top = Instance.new("TextLabel")
top.Size = UDim2.new(1,0,0,40)
top.Text = "Brainrot Hub"
top.TextColor3 = Color3.new(1,1,1)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
top.Parent = main

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,120,1,-40)
sidebar.Position = UDim2.new(0,0,0,40)
sidebar.BackgroundColor3 = Color3.fromRGB(28,28,28)
sidebar.Parent = main

-- CONTENT AREA
local content = Instance.new("Frame")
content.Size = UDim2.new(1,-120,1,-40)
content.Position = UDim2.new(0,120,0,40)
content.BackgroundTransparency = 1
content.Parent = main

-- TAB FUNCTION
local function createTab(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,40)
    button.Text = name
    button.TextColor3 = Color3.new(1,1,1)
    button.BackgroundColor3 = Color3.fromRGB(35,35,35)
    button.Parent = sidebar

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.Visible = false
    frame.BackgroundTransparency = 1
    frame.Parent = content

    button.MouseButton1Click:Connect(function()
        for _,v in pairs(content:GetChildren()) do
            v.Visible = false
        end
        frame.Visible = true
    end)

    return frame
end

-- TABS
local homeTab = createTab("Home")
local playerTab = createTab("Player")
local brainrotTab = createTab("Brainrot")
local teleportTab = createTab("Teleports")

homeTab.Visible = true

-- BUTTON CREATOR
local function createButton(parent,text,pos,callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0,180,0,40)
    button.Position = pos
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(40,40,40)
    button.TextColor3 = Color3.new(1,1,1)
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)
end

-- PLAYER TAB
createButton(playerTab,"Speed 50",UDim2.new(0,20,0,20),function()
    local h = player.Character:FindFirstChildOfClass("Humanoid")
    if h then
        h.WalkSpeed = 50
    end
end)

createButton(playerTab,"High Jump",UDim2.new(0,20,0,70),function()
    local h = player.Character:FindFirstChildOfClass("Humanoid")
    if h then
        h.JumpPower = 100
    end
end)

-- BRAINROT TAB
local enabled = false
createButton(brainrotTab,"Toggle Brainrot Speed",UDim2.new(0,20,0,20),function()
    enabled = not enabled
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if enabled then
        local char = player.Character
        if char then
            local h = char:FindFirstChildOfClass("Humanoid")
            local tool = char:FindFirstChildOfClass("Tool")

            if h and tool and tool.Name == "Brainrot" then
                h.WalkSpeed = 50
            end
        end
    end
end)

-- TELEPORT TAB
createButton(teleportTab,"Spawn",UDim2.new(0,20,0,20),function()
    player.Character:MoveTo(Vector3.new(0,5,0))
end)
