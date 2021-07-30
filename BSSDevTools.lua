local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/botisznt/thing/master/YummySourceV2.lua"))()

noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)
if key == "o" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)


--------------------------------
local player = game:GetService("Players").LocalPlayer

local replicatedstorage = game:GetService("ReplicatedStorage")

local replicatedStorage = replicatedstorage

local function getTokenIcon(tokenType)
    if replicatedstorage.Collectibles:FindFirstChild(tokenType) then
        return table.pack(require(replicatedstorage.Collectibles[tokenType]):Visuals())[2]
    end
    local types = replicatedstorage.EggTypes
    local eggTypes = require(types)
    if eggTypes.Exists(tokenType) then
        return eggTypes.GetTypes()[tokenType].Icon
    end
    if types:FindFirstChild(tokenType.."Icon") then
        return types:FindFirstChild(tokenType.."Icon").Texture
    end
    return "Not Found"
end

local rep = replicatedstorage
local r = require

local function getTimeSinceToyActivation(name)
    return r(rep.OsTime)()-r(rep.ClientStatCache):Get("ToyTimes")[name]
end

local function getTimeUntilToyAvailable(n)
    return workspace.Toys[n].Cooldown.Value-getTimeSinceToyActivation(n)
end

local s = VLib:Window("Bee Swarm Sim","Advanced"," ")
local dev = s:Tab("Dev Tools")
local op = s:Tab("API Output")
local lol = s:Tab("Mob Output")
local moo = s:Tab("Misc Output")
local rt = s:Tab("Toys Table")
local noob = s:Tab("Token Table")

dev:Label("API", function()
end)

rt:Header("Click to copy", function()
end)

noob:Header("Click to copy", function()
end)

local function createWaypoint(thing)
    rt:Button(thing.Name, function()
    setclipboard(thing.Name)
    end)
end


for _, v in pairs(workspace.Toys:GetChildren()) do
    createWaypoint(v)
end


--------------------------------


local function pee(thing)
    noob:Button(thing.Name, function()
    setclipboard(thing.Name)
    end)
end


for _, v in pairs(replicatedstorage.Collectibles:GetChildren()) do
    pee(v)
end


--------------------------------


dev:Textbox("Get Token ID", true,function(ip)
        game.StarterGui:SetCore("SendNotification", {
            Title = "KFC Hub";
            Text = "Check Output";
            Icon = "rbxassetid://1299491401";
            Duration = 5;
        })
op:Label(ip..":  "..getTokenIcon(ip), function()
end)
end)

dev:Textbox("Get Toy Cooldown", true,function(ip)
        game.StarterGui:SetCore("SendNotification", {
            Title = "KFC Hub";
            Text = "Check Output";
            Icon = "rbxassetid://1299491401";
            Duration = 5;
        })
op:Label(ip..":  "..getTimeUntilToyAvailable(ip), function()
end)
end)

dev:Textbox("Get A Player's Honey Amount", true,function(ip)
        game.StarterGui:SetCore("SendNotification", {
            Title = "KFC Hub";
            Text = "Check Output";
            Icon = "rbxassetid://1299491401";
            Duration = 5;
        })
for _, v in pairs(game.Players:GetChildren()) do
if string.find(v.Name, ip) then
op:Label(v.Name.."'s Honey:  "..v.CoreStats.Honey.Value, function()
end)
else
op:Label("Player Not Found", function()
end)
end
end
end)


dev:Textbox("Get A Player's Pollen Amount", true,function(ip)
        game.StarterGui:SetCore("SendNotification", {
            Title = "KFC Hub";
            Text = "Check Output";
            Icon = "rbxassetid://1299491401";
            Duration = 5;
        })
for _, v in pairs(game.Players:GetChildren()) do
if string.find(v.Name, ip) then
op:Label(v.Name.."'s Pollen:  "..v.CoreStats.Pollen.Value, function()
end)
else
op:Label("Player Not Found", function()
end)
end
end
end)


dev:Textbox("Get A Player's Capacity", true,function(ip)
        game.StarterGui:SetCore("SendNotification", {
            Title = "KFC Hub";
            Text = "Check Output";
            Icon = "rbxassetid://1299491401";
            Duration = 5;
        })
for _, v in pairs(game.Players:GetChildren()) do
if string.find(v.Name, ip) then
op:Label(v.Name.."'s Capacity:  "..v.CoreStats.Capacity.Value, function()
end)
else
op:Label("Player Not Found", function()
end)
end
end
end)


dev:Button("Print Server Tick", function()
print("Server Tick: "..game:GetService("Workspace").ServerTick.Value)
op:Label("Server Tick: "..game:GetService("Workspace").ServerTick.Value, function()
end)  
end)

dev:Button("Print Server Version", function()
print("Server Version: v"..game:GetService("Workspace").ServerVersion.Value)
op:Label("Server Version: v"..game:GetService("Workspace").ServerVersion.Value, function()
end)  
end)

dev:Button("Copy Character Position", function()
setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)) 
end)


lol:Toggle("Enable Mob Output", function(a)
moutput = a
end)
game.Workspace.Monsters.ChildAdded:Connect(function(child)
for _, e in pairs(game:GetService("ReplicatedStorage").MonsterTypes:GetChildren()) do
if string.find(child.Name, e.Name) and moutput == true then
lol:Button(e.Name.." Has Spawned | Click to Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.Torso.CFrame.Position + Vector3.new(0,10,0))
    noclip = true
    wait(2)
    noclip = false
end) 
else

end
end
end)


--------------------------------

moo:Toggle("Enable Misc Output", function(a)
miscoutput = a
windything = a
vicithing = a
fireflything = a
mondothing = a
sprinklerseek = a
questthing = a
end)

game:GetService("Workspace").Particles.Folder2.ChildAdded:Connect(function(child)
if string.find(child.Name, "Sprout") and miscoutput == true then
moo:Button("Sprout Has Spawned | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.CFrame.Position + Vector3.new(0,35,0))
end)
end
end)

game:GetService("Workspace").NPCBees.ChildAdded:Connect(function(child)
if string.find(child.Name, "Windy") and windything == true then
moo:Button("Windy Bee has Spawned | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.Torso.CFrame.Position + Vector3.new(0,35,0))
end)
end
end)

game:GetService("Workspace").Monsters.ChildAdded:Connect(function(child)
if string.find(child.Name, "Vici") and vicithing == true then
moo:Button("Vicious Bee has Spawned | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.Torso.CFrame.Position + Vector3.new(0,35,0))
end)
end
end)

game:GetService("Workspace").NPCBees.ChildAdded:Connect(function(child)
if string.find(child.Name, "Firefly") and fireflything == true then
moo:Button("Firefly has Spawned | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(child.CFrame.Position + Vector3.new(0,35,0))
end)
end
end)

game:GetService("Workspace").Monsters.ChildAdded:Connect(function(child)
if string.find(child.Name, "Mond") and mondothing == true then
moo:Button("Mondo Chick has Spawned | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Mondo Chick Summoner"].CFrame
end)
end
end)

game:GetService("Workspace").Gadgets.ChildAdded:Connect(function(child)
if sprinklerseek == true then
moo:Button(child.Name.." Has been Placed | Click to Teleport", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.Base.CFrame
end)
end
end)
