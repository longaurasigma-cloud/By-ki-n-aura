if setfpscap then
    setfpscap(120)
end

local settings = settings()
settings.Rendering.QualityLevel = Enum.QualityLevel.Level21
settings.Network.IncomingReplicationLag = -1

local RunService = game:GetService("RunService")
RunService.Stepped:Connect(function()
    sethiddenproperty(game.Workspace, "StreamingTargetRadius", 1500)
    sethiddenproperty(game.Workspace, "StreamingMinRadius", 500)
end)

task.spawn(function()
    while task.wait(5) do
        collectgarbage("collect")
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KienCongTu_FPS_Counter"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 75, 0, 22)
toggleButton.Position = UDim2.new(0.02, 0, 0.01, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
toggleButton.BackgroundTransparency = 0.3
toggleButton.Text = "Ẩn/Hiện"
toggleButton.TextColor3 = Color3.fromRGB(0, 255, 255)
toggleButton.TextSize = 10
toggleButton.Font = Enum.Font.RobotoMono
toggleButton.Parent = screenGui

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 4)
btnCorner.Parent = toggleButton

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(0, 255, 255)
btnStroke.Thickness = 1
btnStroke.Parent = toggleButton

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 110, 0, 32)
mainFrame.Position = UDim2.new(0.02, 0, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BackgroundTransparency = 0.4
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 0, 127)
uiStroke.Thickness = 1.2
uiStroke.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.4, 0)
titleLabel.Position = UDim2.new(0, 0, 0.1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "kiên công tử 8A"
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
titleLabel.TextSize = 10
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0.5, 0)
fpsLabel.Position = UDim2.new(0, 0, 0.45, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: --"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = 12
fpsLabel.Font = Enum.Font.RobotoMono
fpsLabel.Parent = mainFrame

local fpsCount = 0
RunService.RenderStepped:Connect(function()
    fpsCount = fpsCount + 1
end)

task.spawn(function()
    while true do
        fpsLabel.Text = "FPS: " .. tostring(fpsCount)
        fpsCount = 0
        task.wait(1)
    end
end)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

task.spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            uiStroke.Color = Color3.fromHSV(i, 1, 1)
            if toggleButton:FindFirstChildOfClass("UIStroke") then
                toggleButton:FindFirstChildOfClass("UIStroke").Color = Color3.fromHSV((i + 0.5) % 1, 1, 1)
            end
            titleLabel.TextColor3 = Color3.fromHSV((i + 0.2) % 1, 1, 1)
            task.wait(0.03)
        end
    end
end)

print("Đã kích hoạt cấu hình siêu mượt và menu FPS Neon mini kiên công tử 8A!")
