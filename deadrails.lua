local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "epik notify";
    Text = "sorry for any bugs";
    Icon = "rbxassetid://104451507735118";
    Duration = 5;
})

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Notification";
    Text = "Use at your own risk";
    Icon = "rbxassetid://104451507735118";
    Duration = 5;
})

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Dead Rails ( Game )", "Default")

local gameTab = DrRayLibrary.newTab("Game", "94686701553550")

local combat = DrRayLibrary.newTab("Combat", "106320962549600")

local esp = DrRayLibrary.newTab("Esp", "130912144788684")

local tp = DrRayLibrary.newTab("Teleport", "90399170774000")

local misc = DrRayLibrary.newTab("Misc", "136803332900204")

_G.hitboxEnabled = false
local hitboxSize = Vector3.new(5, 5, 5)
local hitboxTransparency = 0.5
local hitboxColor = BrickColor.new("White")

local function enableHitbox()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("Head") then
            if not game.Players:GetPlayerFromCharacter(object) then
                local head = object:FindFirstChild("Head")
                head.Size = hitboxSize
                head.Transparency = hitboxTransparency
                head.BrickColor = hitboxColor
                head.CanCollide = false
            end
        end
    end
end

local function disableHitbox()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("Head") then
            if not game.Players:GetPlayerFromCharacter(object) then
                local head = object:FindFirstChild("Head")
                head.Size = Vector3.new(2, 1, 1)
                head.Transparency = 0
                head.BrickColor = BrickColor.new("Medium stone grey")
                head.CanCollide = true
            end
        end
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

_G.OriginalParents = {}

function _G.MovePrompts()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            for _, descendant in pairs(player.Character:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    if not _G.OriginalParents[descendant] then
                        _G.OriginalParents[descendant] = descendant.Parent
                    end

                    local attachment = Instance.new("Attachment", HumanoidRootPart)
                    descendant.Parent = attachment
                    print("ProximityPrompt từ", player.Name, "đã được di chuyển tới LocalPlayer!")
                end
            end
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        character.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") then
                if not _G.OriginalParents[descendant] then
                    _G.OriginalParents[descendant] = descendant.Parent
                end
                local attachment = Instance.new("Attachment", HumanoidRootPart)
                descendant.Parent = attachment
                print("ProximityPrompt từ người chơi mới", player.Name, "đã được di chuyển tới LocalPlayer!")
            end
        end)
    end)
end)

function _G.RestorePrompts()
    for prompt, originalParent in pairs(_G.OriginalParents) do
        if prompt and originalParent then
            prompt.Parent = originalParent
            print("ProximityPrompt đã được khôi phục về vị trí ban đầu!")
        end
    end
    _G.OriginalParents = {}
end

_G.FastEEnabled = false

_G.FastEEnable = function()
    if not _G.FastEEnabled then
        for _, prompt in pairs(game:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0
            end
        end

        game.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") then
                descendant.HoldDuration = 0
            end
        end)

        _G.FastEEnabled = true
        print("ProximityPrompt HoldDuration đã đặt thành 0!")
    end
end

_G.FastEDisable = function()
    if _G.FastEEnabled then
        for _, prompt in pairs(game:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 3
            end
        end

        _G.FastEEnabled = false
        print("ProximityPrompt HoldDuration đã đặt lại thành 3!")
    end
end

local Workspace = game.Workspace
local Players = game.Players
local LocalPlayer = Players.LocalPlayer

local ActiveESP = {}

local function clearAllESP()
    for _, esp in pairs(ActiveESP) do
        if esp and esp.Parent then
            esp:Destroy()
        end
    end
    ActiveESP = {}
end

local function createHighlight(monster)
    for _, esp in pairs(ActiveESP) do
        if esp.Adornee == monster then
            return
        end
    end

    local highlight = Instance.new("Highlight")
    highlight.Adornee = monster
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.Parent = monster

    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = monster:WaitForChild("HumanoidRootPart")
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Parent = billboard

    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        if monster and monster:FindFirstChild("HumanoidRootPart") and monster:FindFirstChild("Humanoid") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - monster.HumanoidRootPart.Position).Magnitude
            textLabel.Text = monster.Name .. " - " .. string.format("%.1f m", distance)
        else
            connection:Disconnect()
            if highlight.Parent then highlight:Destroy() end
            if billboard.Parent then billboard:Destroy() end
        end
    end)

    table.insert(ActiveESP, highlight)
    table.insert(ActiveESP, billboard)
end

local function removePlayerESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Highlight") then
            player.Character.Highlight:Destroy()
        end
    end
end

local function createMonsterESP()
    for _, object in pairs(Workspace:GetDescendants()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(object) then
            createHighlight(object)
        end
    end

    Workspace.DescendantAdded:Connect(function(object)
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(object) then
            createHighlight(object)
        end
    end)
end

_G.ESPEnabled = false

_G.EnableESP = function()
    if not _G.ESPEnabled then
        clearAllESP()
        removePlayerESP()
        createMonsterESP()
        _G.ESPEnabled = true
        print("ESP đã bật!")
    end
end

_G.DisableESP = function()
    if _G.ESPEnabled then
        clearAllESP()
        _G.ESPEnabled = false
        print("ESP đã tắt!")
    end
end

local function getPlayers()
    local players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function noclipLoop()
    if _G.Noclip and character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

RunService.Heartbeat:Connect(noclipLoop)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

tp.newLabel("Tip: 10km teleport to castle only works in singleplayer (I think)")

tp.newDropdown("Select Player", "", getPlayers(), function(selectedOption)
    selectedPlayer = selectedOption
end)

tp.newButton("Teleport to player", "", function()
    if selectedPlayer then
        local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
            local localPlayer = game.Players.LocalPlayer
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
            else
                warn("Bạn không có HumanoidRootPart!")
            end
        else
            warn("Không thể tìm thấy người chơi được chọn hoặc người đó không hợp lệ.")
        end
    else
        warn("Hãy chọn một người chơi trước khi dịch chuyển.")
    end
end)

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

gameTab.newInput("Walkspeed", "Default Walkspeed is 16", function(walk)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walk
end)

gameTab.newInput("Jump Power", "Default Jump Power is 50", function(jump)
    local Players = game:GetService("Players")
local player = Players.LocalPlayer

local JUMP_POWER = jump

player.CharacterAdded:Connect(function(character)
    repeat task.wait() until character:FindFirstChild("Humanoid")
    character.Humanoid.JumpPower = JUMP_POWER
    character.Humanoid.JumpHeight = JUMP_POWER / 2.5
end)

if player.Character and player.Character:FindFirstChild("Humanoid") then
    player.Character.Humanoid.JumpPower = JUMP_POWER
    player.Character.Humanoid.JumpHeight = JUMP_POWER / 2.5
end
end)

gameTab.newToggle("Infinite Jump", "helps you jump no cooldown", false, function(toggleState)
    if toggleState then
        _G.InfiniteJumpEnabled = true
    else
        _G.InfiniteJumpEnabled = false
    end
end)

gameTab.newToggle("Noclip", "help you go through walls", false, function(toggleState)
    if toggleState then
        _G.Noclip = true
    else
        _G.Noclip = false
    end
end)

gameTab.newToggle("Unlock third person", "press again to turn off", false, function(toggleState)
    if toggleState then
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 50
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
    else
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0
        game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    end
end)

misc.newInput("Money", "this is just a virtual number", function(money)
    game.Players.LocalPlayer.leaderstats.Money.Value = money
end)

misc.newButton("Clone Shovel", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Shovel") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Sack", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Sack") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Molotov", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Molotov") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Snake Oil", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Snake Oil") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Hammer", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Hammer") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Pickaxe", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pickaxe") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Axe", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Axe") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Bandage", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Bandage") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Rifle", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Rifle") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Revolver", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Revolver") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Shotgun", "you must have item and don't holding it", function()
    local player = game.Players.LocalPlayer
local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Shotgun") 

if tool then
    local clonedTool = tool:Clone()
    clonedTool.Parent = player.Backpack
		end
end)

misc.newButton("Clone Vampire Knife", "you must have item and don't holding it", function()
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
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.Parent = character
    
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = character:WaitForChild("HumanoidRootPart")
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Parent = billboard

    game:GetService("RunService").RenderStepped:Connect(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
            textLabel.Text = character.Name .. " - " .. string.format("%.1f m", distance)
        end
    end)

    billboard.Parent = character
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createHighlight(player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        createHighlight(character)
    end)
end

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

local function createHighlightForModel(model)
    if not model:IsA("Model") or not model.PrimaryPart then
        warn(model.Name .. " không có PrimaryPart. Vui lòng thiết lập PrimaryPart!")
        return
    end

    local primaryPart = model.PrimaryPart

    local highlight = Instance.new("Highlight")
    highlight.Adornee = model
    highlight.FillColor = Color3.fromRGB(0, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.2
    highlight.Parent = model

    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = primaryPart
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.Text = model.Name
    textLabel.Parent = billboard

    game:GetService("RunService").RenderStepped:Connect(function()
        if primaryPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - primaryPart.Position).Magnitude
            textLabel.Text = model.Name .. " - " .. string.format("%.1f m", distance)
        end
    end)

    billboard.Parent = primaryPart
end

local folder = Workspace:FindFirstChild("RuntimeItems")
if not folder then
    warn("Folder không tồn tại trong Workspace!")
    return
end

for _, model in pairs(folder:GetChildren()) do
    if model:IsA("Model") then
        createHighlightForModel(model)
    end
end

folder.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        createHighlightForModel(child)
    end
end)
    else
        local function removeHighlightAndGui(model)
    if model:IsA("Model") then
        local highlight = model:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end

        if model.PrimaryPart then
            local billboard = model.PrimaryPart:FindFirstChildOfClass("BillboardGui")
            if billboard then
                billboard:Destroy()
            end
        end
    end
end

local folder = game.Workspace:FindFirstChild("RuntimeItems")
if folder then
    for _, model in pairs(folder:GetChildren()) do
        removeHighlightAndGui(model)
    end
else
    warn("Folder không tồn tại trong Workspace!")
			end
    end
end)

gameTab.newButton("Bring Item", "bring all item to you", function()
local Players = game:GetService("Players")
local Workspace = game.Workspace
local runtimeItemsFolder = Workspace:FindFirstChild("RuntimeItems")
local localPlayer = Players.LocalPlayer

local function bringItemsToLocalPlayer()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        warn("Người chơi không có HumanoidRootPart!")
        return
    end

    local function moveItem(item)
        if item:IsA("Model") and item.PrimaryPart then
            local offset = humanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            item:SetPrimaryPartCFrame(offset)
        else
            warn("Item không hợp lệ hoặc không có PrimaryPart: " .. item.Name)
        end
    end

    for _, item in pairs(runtimeItemsFolder:GetChildren()) do
        moveItem(item)
        wait(0.1)
    end
end

bringItemsToLocalPlayer()
end)

combat.newToggle("Aimbot NPC", "help you aim better", false, function(toggleState)
    if toggleState then
        _G.Aimbot.start()
    else
        _G.Aimbot.stop()
    end
end)

combat.newInput("Aimbot FOV", "resize circle", function(fovInput)
local fov = 136
local AUTO_START = false

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Cam = workspace.CurrentCamera
local Player = game:GetService("Players").LocalPlayer

local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(255, 255, 255)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local isAiming = false
local validNPCs = {}
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local function isNPC(obj)
    local humanoid = obj:FindFirstChild("Humanoid")
    return obj:IsA("Model")
        and humanoid
        and humanoid.Health > 0
        and obj:FindFirstChild("Head")
        and obj:FindFirstChild("HumanoidRootPart")
        and not game:GetService("Players"):GetPlayerFromCharacter(obj)
end

local function updateNPCs()
    validNPCs = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if isNPC(obj) then
            table.insert(validNPCs, obj)
        end
    end
end

local function predictPos(target)
    local head = target:FindFirstChild("Head")
    return head and (head.Position + head.Velocity * 0.15) or Vector3.zero
end

local function getTarget()
    local nearest = nil
    local minDistance = math.huge
    local viewportCenter = Cam.ViewportSize / 2
    
    for _, npc in ipairs(validNPCs) do
        local humanoid = npc:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 then
            local predictedPos = predictPos(npc)
            local screenPos, visible = Cam:WorldToViewportPoint(predictedPos)
            if visible then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                if distance < minDistance and distance < fov then
                    minDistance = distance
                    nearest = npc
                end
            end
        end
    end
    
    return nearest
end

local function updateAimbot()
    FOVring.Position = Cam.ViewportSize / 2
    FOVring.Radius = fov * (Cam.ViewportSize.Y / 1080)
    
    if isAiming then
        local target = getTarget()
        if target then
            local predictedPosition = predictPos(target)
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, predictedPosition)
        end
    end
end

local function start()
    isAiming = true
    FOVring.Visible = true
    updateNPCs()
end

local function stop()
    isAiming = false
    FOVring.Visible = false
end

local function toggle()
    if isAiming then
        stop()
    else
        start()
    end
end

RunService.Heartbeat:Connect(updateAimbot)
workspace.DescendantAdded:Connect(function(desc) if isNPC(desc) then updateNPCs() end end)
workspace.DescendantRemoving:Connect(function(desc) if isNPC(desc) then updateNPCs() end end)

if AUTO_START then start() end

_G.Aimbot = {
    start = start,
    stop = stop,
    toggle = toggle,
    setFOV = function(value)
        fov = value
        FOVring.Radius = value * (Cam.ViewportSize.Y / 1080)
    end
}

esp.newToggle("ESP Enemies", "idk", false, function(toggleState)
    if toggleState then
        _G.EnableESP()
    else
        _G.DisableESP()
    end
end)

gameTab.newToggle("Fast Hold E", "It will help you collect money, save teammates quickly without waiting.", false, function(toggleState)
    if toggleState then
        _G.FastEEnable()
    else
        _G.FastEDisable()
    end
end)

gameTab.newToggle("Teleport Other E Button To You", "Teleport the dying player's e button to you (will help you save them from a distance)", false, function(toggleState)
    if toggleState then
        _G.MovePrompts()
    else
        _G.RestorePrompts()
    end
end)

combat.newToggle("Hitbox Head Enemies", "", false, function(toggleState)
    _G.hitboxEnabled = toggleState
    if _G.hitboxEnabled then
        enableHitbox()
    else
        disableHitbox()
    end
end)

combat.newInput("Hitbox Size", "Enter hitbox size (x,y,z)", function(text)
    local sizeValues = string.split(text, ",")
    if #sizeValues == 3 then
        hitboxSize = Vector3.new(tonumber(sizeValues[1]), tonumber(sizeValues[2]), tonumber(sizeValues[3]))
        if _G.hitboxEnabled then enableHitbox() end
    end
end)

combat.newInput("Hitbox Transparency", "Enter Value (0.0 - 1.0)", function(text)
    local transparencyValue = tonumber(text)
    if transparencyValue and transparencyValue >= 0 and transparencyValue <= 1 then
        hitboxTransparency = transparencyValue
        if _G.hitboxEnabled then enableHitbox() end
    end
end)

combat.newDropdown("Hitbox Color", "choose a color for the hitbox", {"White", "Black", "Red", "Blue", "Yellow", "Green", "Brown", "Orange"}, function(selected)
    local colorMap = {
        ["White"] = BrickColor.new("White"),
        ["Black"] = BrickColor.new("Black"),
        ["Red"] = BrickColor.new("Bright red"),
        ["Blue"] = BrickColor.new("Bright blue"),
        ["Yellow"] = BrickColor.new("Bright yellow"),
        ["Green"] = BrickColor.new("Bright green"),
        ["Brown"] = BrickColor.new("Brown"),
        ["Orange"] = BrickColor.new("Bright orange")
    }
    hitboxColor = colorMap[selected] or BrickColor.new("White")
    if _G.hitboxEnabled then enableHitbox() end
end)
