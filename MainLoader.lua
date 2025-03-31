-- you can use this code to load my script: loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggisreal/my-script/refs/heads/main/MainLoader.lua"))()
if game.PlaceId == 116495829188952 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggisreal/my-script/refs/heads/main/DeadRails.lua"))()

    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Status:✅";
        Text = "Game Found: Dead Rails";
        Icon = "rbxassetid://104451507735118";
        Duration = 5;
    })
elseif game.PlaceId == 70876832253163 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggisreal/my-script/refs/heads/main/DeadRails.lua"))()
    
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Status:✅";
        Text = "Game Found: Dead Rails";
        Icon = "rbxassetid://104451507735118";
        Duration = 5;
    })
elseif game.PlaceId == 18843545945 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggisreal/my-script/refs/heads/main/BeADog.lua"))()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Status:✅";
        Text = "Game Found: Be A Dog";
        Icon = "rbxassetid://104451507735118";
        Duration = 5;
    })
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Status:❌";
        Text = "Game Not Supported";
        Icon = "rbxassetid://104451507735118";
        Duration = 5;
    })
end
