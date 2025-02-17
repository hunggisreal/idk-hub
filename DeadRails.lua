local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Dead Rails ( Game )", "Default")

local tp = DrRayLibrary.newTab("Teleport", "ImageIdHere")

local other = DrRayLibrary.newTab("Other", "ImageIdHere")

local troll = DrRayLibrary.newTab("Trolling", "ImageIdHere")

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
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
end)

other.newButton("Infinite Jump", "", function()
    local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

troll.newInput("Money", "this is just a virtual number", function(money)
    game.Players.LocalPlayer.leaderstats.Money.Value = money
end)
