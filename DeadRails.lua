local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "epik notify";
    Text = "sorry for any bugs";
    Icon = "rbxassetid://104451507735118";
    Duration = 10;
})

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Dead Rails ( Game )", "Default")

local tp = DrRayLibrary.newTab("Teleport", "ImageIdHere")

local other = DrRayLibrary.newTab("Other", "ImageIdHere")

local troll = DrRayLibrary.newTab("Trolling", "ImageIdHere")

local esp = DrRayLibrary.newTab("Esp", "ImageIdHere")

tp.newButton("0 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.3884506, 5.33051872, 29649.4609, -0.866007447, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, -0.866007447)
end)

tp.newButton("10 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-167.869965, 4.9305191, 20089.4766, -0.770644307, 0, 0.637265682, 0, 1, 0, -0.637265682, 0, -0.770644307)
end)

tp.newButton("20 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-534.848999, 4.9305191, 10453.1777, -0.814716101, 0, 0.579860091, 0, 1, 0, -0.579860091, 0, -0.814716101)
end)

tp.newButton("30 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-490.432831, 4.9305191, 641.059631, -0.917066813, 0, 0.398733884, 0, 1, 0, -0.398733884, 0, -0.917066813)
end)

tp.newButton("40 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-131.026077, 4.9305191, -9591.67383, -0.934402943, 0, 0.356217712, 0, 1, 0, -0.356217712, 0, -0.934402943)
end)

tp.newButton("50 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(60.4955826, 4.9305191, -19309.1992, -0.854230165, 0, 0.519895077, 0, 1, 0, -0.519895077, 0, -0.854230165)
end)

tp.newButton("60 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-225.082458, 4.9305191, -29233.5078, -0.767358899, 0, 0.641218483, 0, 1, 0, -0.641218483, 0, -0.767358899)
end)

tp.newButton("70 km Sign", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-602.017761, 4.9305191, -39066.0312, -0.826300025, 0, 0.563230455, 0, 1, 0, -0.563230455, 0, -0.826300025)
end)

tp.newButton("Bridge Lever", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-369.159058, 1.24993896, -49048, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

tp.newButton("Castle", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229.593414, 23.8715992, -9025.61621, 0.015201509, 0, 0.999884427, 0, 1, 0, -0.999884427, 0, 0.015201509)
end)

other.newInput("Walkspeed", "Default Walkspeed is 16", function(walk)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walk
end)

other.newInput("Jump Power", "Default Jump Power is 50", function(jump)
    while true do
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
    wait(0.1)
		end
end)

other.newButton("Infinite Jump", "", function()
    local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

other.newToggle("Noclip", "help you go through walls", false, function(toggleState)
    if toggleState then
        -- Khi toggleState = true, bắt đầu vòng lặp Noclip
        while true do
            -- Kiểm tra và thay đổi thuộc tính CanCollide của các phần tử trong nhân vật
            for _, plrpart in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if plrpart:IsA("BasePart") then
                    plrpart.CanCollide = false  -- Tắt va chạm với các phần tử BasePart
                end
            end
            wait(0.5)
        end
      else
        for _, plrpart in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if plrpart:IsA("BasePart") then
                plrpart.CanCollide = true  -- Bật va chạm lại
            end
        end
    end
end)

other.newToggle("Unlock third person", "press again to turn off", false, function(toggleState)
    if toggleState then
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 50
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
    else
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    end
end)

troll.newInput("Money", "this is just a virtual number", function(money)
    game.Players.LocalPlayer.leaderstats.Money.Value = money
end)

troll.newButton("Clone Shovel", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Shovel") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Sack", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Sack") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Molotov", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Molotov") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Snake Oil", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Snake Oil") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Hammer", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Pickaxe", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pickaxe") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Axe", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Axe") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Bandage", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Bandage") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Rifle", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Rifle") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Revolver", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Revolver") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Shotgun", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Shotgun") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

troll.newButton("Clone Vampire Knife", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Vampire Knife") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

esp.newToggle("Esp player", "highlight all player and display the meter number", false, function(toggleState)
    if toggleState then
        local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Workspace = game.Workspace

local function createHighlight(character)
    -- Tạo Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.Parent = character

    -- Tạo BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = character:WaitForChild("HumanoidRootPart")
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    -- Tạo TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Parent = billboard

    -- Cập nhật Tên và Khoảng Cách
    game:GetService("RunService").RenderStepped:Connect(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
            textLabel.Text = character.Name .. " - " .. string.format("%.1f m", distance)
        end
    end)

    billboard.Parent = character
end

-- Tạo Highlight cho người chơi hiện tại và khi respawn
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createHighlight(player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        createHighlight(character)
    end)
end

-- Khi người chơi mới tham gia
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHighlight(character)
    end)
end)
    else
        local function removeHighlightAndGui(character)
    if character then
        local highlight = character:FindFirstChildOfClass("Highlight")
        if highlight then highlight:Destroy() end

        local billboard = character:FindFirstChildOfClass("BillboardGui")
        if billboard then billboard:Destroy() end
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        removeHighlightAndGui(player.Character)
    end
    player.CharacterAdded:Connect(removeHighlightAndGui)
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(removeHighlightAndGui)
end)
    end
end)

esp.newToggle("Esp items", "highlight all items and display the meter number", false, function(toggleState)
    if toggleState then
        local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Workspace = game.Workspace

-- Hàm tạo highlight và hiển thị tên + khoảng cách
local function createHighlightForModel(model)
    if not model:IsA("Model") or not model.PrimaryPart then
        warn(model.Name .. " không có PrimaryPart. Vui lòng thiết lập PrimaryPart!")
        return
    end

    local primaryPart = model.PrimaryPart

    -- Tạo Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = model
    highlight.FillColor = Color3.fromRGB(0, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.2
    highlight.Parent = model

    -- Tạo BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = primaryPart
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    -- Tạo TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Text = model.Name -- Hiển thị tên Model ban đầu
    textLabel.Parent = billboard

    -- Cập nhật Khoảng Cách
    game:GetService("RunService").RenderStepped:Connect(function()
        if primaryPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - primaryPart.Position).Magnitude
            textLabel.Text = model.Name .. " - " .. string.format("%.1f m", distance) -- Hiển thị tên và khoảng cách
        end
    end)

    billboard.Parent = primaryPart
end

-- Lấy Folder
local folder = Workspace:FindFirstChild("RuntimeItems") -- Thay "YourFolderName" bằng tên folder
if not folder then
    warn("Folder không tồn tại trong Workspace!")
    return
end

-- Áp dụng highlight cho các Model hiện có trong Folder
for _, model in pairs(folder:GetChildren()) do
    if model:IsA("Model") then
        createHighlightForModel(model)
    end
end

-- Tự động thêm highlight cho các Model mới
folder.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        createHighlightForModel(child)
    end
end)
    else
        local function removeHighlightAndGui(model)
    if model:IsA("Model") then
        -- Xóa Highlight
        local highlight = model:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end

        -- Xóa BillboardGui
        if model.PrimaryPart then
            local billboard = model.PrimaryPart:FindFirstChildOfClass("BillboardGui")
            if billboard then
                billboard:Destroy()
            end
        end
    end
end

-- Lấy Folder và xóa highlight + gui cho tất cả Model
local folder = game.Workspace:FindFirstChild("RuntimeItems") -- Thay "YourFolderName" bằng tên folder
if folder then
    for _, model in pairs(folder:GetChildren()) do
        removeHighlightAndGui(model)
    end
else
    warn("Folder không tồn tại trong Workspace!")
			end
    end
end)
