if game.PlaceId == 6403373529 then
 
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "sú hub", HidePremium = false, IntroText = "not normally intro", SaveConfig = false, ConfigFolder = "OrionTest"})

local gloveoptional = Window:MakeTab({
	Name = "Glove Optional",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

gloveoptional:AddButton({
	Name = "100 point pillow",
	Callback = function()
      		for i = 1, 100 do
    local args = {
    [1] = "AddPillow"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PillowEvent"):FireServer(unpack(args))

				end
  	end    
})
end
end
end
