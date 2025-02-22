local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Dead Rails", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "epik intro"})
local game = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local tp = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local troll = Window:MakeTab({
	Name = "Trolling",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

game:AddButton({
	Name = "Bring Items",
	Callback = function()
      		local Players = game:GetService("Players")
local Workspace = game.Workspace
local runtimeItemsFolder = Workspace:FindFirstChild("RuntimeItems") -- Thư mục chứa các item
local localPlayer = Players.LocalPlayer -- Lấy LocalPlayer

-- Hàm để đưa tất cả item tới vị trí của LocalPlayer
local function bringItemsToLocalPlayer()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        warn("Người chơi không có HumanoidRootPart!")
        return
    end

    -- Lặp qua tất cả các item trong thư mục RuntimeItems
    for _, item in pairs(runtimeItemsFolder:GetChildren()) do
        if item:IsA("Model") and item.PrimaryPart then
            -- Đưa từng item đến vị trí của LocalPlayer
            item:SetPrimaryPartCFrame(humanoidRootPart.CFrame)
        else
            warn("Item không hợp lệ hoặc không có PrimaryPart: " .. item.Name)
        end
    end
end

-- Gọi hàm để đưa các item tới LocalPlayer
bringItemsToLocalPlayer()
  	end    
})

tp:AddLabel("Note: it only works in singleplayer")

tp:AddButton({
	Name = "Teleport to 0km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.3884506, 5.33051872, 29649.4609, -0.866007447, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, -0.866007447
  	end    
})

tp:AddButton({
	Name = "Teleport to 10km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-167.869965, 4.9305191, 20089.4766, -0.770644307, 0, 0.637265682, 0, 1, 0, -0.637265682, 0, -0.770644307
  	end    
})

tp:AddButton({
	Name = "Teleport to 20km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-534.848999, 4.9305191, 10453.1777, -0.814716101, 0, 0.579860091, 0, 1, 0, -0.579860091, 0, -0.814716101
  	end    
})

tp:AddButton({
	Name = "Teleport to 30km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-490.432831, 4.9305191, 641.059631, -0.917066813, 0, 0.398733884, 0, 1, 0, -0.398733884, 0, -0.917066813
  	end    
})

tp:AddButton({
	Name = "Teleport to 40km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-131.026077, 4.9305191, -9591.67383, -0.934402943, 0, 0.356217712, 0, 1, 0, -0.356217712, 0, -0.934402943
  	end    
})

tp:AddButton({
	Name = "Teleport to 50km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(60.4955826, 4.9305191, -19309.1992, -0.854230165, 0, 0.519895077, 0, 1, 0, -0.519895077, 0, -0.854230165
  	end    
})

tp:AddButton({
	Name = "Teleport to 60km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-225.082458, 4.9305191, -29233.5078, -0.767358899, 0, 0.641218483, 0, 1, 0, -0.641218483, 0, -0.767358899
  	end    
})

tp:AddButton({
	Name = "Teleport to 70km sign",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-602.017761, 4.9305191, -39066.0312, -0.826300025, 0, 0.563230455, 0, 1, 0, -0.563230455, 0, -0.826300025
  	end    
})

tp:AddButton({
	Name = "Teleport to The Bridge",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-369.159058, 1.24993896, -49048, 1, 0, 0, 0, 1, 0, 0, 0, 1
  	end    
})

tp:AddButton({
	Name = "Teleport to Castle",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229.593414, 23.8715992, -9025.61621, 0.015201509, 0, 0.999884427, 0, 1, 0, -0.999884427, 0, 0.015201509
  	end    
})

troll:AddTextbox({
	Name = "Money changing (virtual)",
	Default = "",
	TextDisappear = true,
	Callback = function(money)
		game.Players.LocalPlayer.leaderstats.Money.Value = money
	end	  
})

troll:AddTextbox({
	Name = "Bonds changing (virtual)",
	Default = "",
	TextDisappear = true,
	Callback = function(bonds)
		game.Players.LocalPlayer.PlayerGui.BondGui.BondInfo.BondCount.Text = bonds
	end	  
})

									end
								end
							end
						end
					end
				end
			end
		end
	end
end
