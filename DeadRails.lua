if game.PlaceId == 116495829188952 then

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Dead Rails", "Default")

local Other = DrRayLibrary.newTab("Other", "ImageIdHere")

Other.newButton("No Fog", "No Fog Status: Enable", function()
    local Lighting = game:GetService("Lighting")

-- Xoá hoàn toàn sương mù
Lighting.FogStart = 0
Lighting.FogEnd = 1e6 -- 1 triệu, đảm bảo sương mù không xuất hiện
Lighting.FogColor = Color3.fromRGB(255, 255, 255) -- Màu trắng để tránh ảnh hưởng

-- Kiểm tra nếu có thay đổi trong Lighting
Lighting.Changed:Connect(function()
    Lighting.FogStart = 0
    Lighting.FogEnd = 1e6
end)
