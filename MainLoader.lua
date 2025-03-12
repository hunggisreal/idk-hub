if game.PlaceId == 116495829188952 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggchuaii/my-script/refs/heads/main/DeadRailsLobby.lua"))()
else if game.PlaceId == 70876832253163 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hunggchuaii/my-script/refs/heads/main/DeadRails.lua"))()
else
     local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "epik notify";
    Text = "Game Not Supported!❌";
    Icon = "rbxassetid://104451507735118";
    Duration = 5;
})
end
