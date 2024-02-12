local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/LypherX/FTagSource/main/MoriScripts')))()
-- IMPORTANT LOCAL
local PartnerRank = "🔥Partner"
local DeveloperRank = "⚒️Developer"
local ModeratorRank = "🔧Moderator"
local LeaderboardRank = "🌍#82"
local SignerRank = "✏️Signer"
local Wow = "OMG REAL HE SIGN MY HUGES!                                                                                                                                     "
local speed = (game.Players.LocalPlayer.Character.Humanoid.WalkSpeed)
local jump = (game.Players.LocalPlayer.Character.Humanoid.JumpPower)
Username = game.Players.LocalPlayer.DisplayName
SpamTime = 10
-- SCRIPT
local Window = OrionLib:MakeWindow({Name = "Mori Fake Tag", HidePremium = false, SaveConfig = true, ConfigFolder = "Mori Scripts"})

local Tab = Window:MakeTab({
	Name = "Misc Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Anti Lag",
	Callback = function()
      		local lighting = game.Lighting
local terrain = game.Workspace.Terrain
terrain.WaterWaveSize = 0
terrain.WaterWaveSpeed = 0
terrain.WaterReflectance = 0
terrain.WaterTransparency = 0
lighting.GlobalShadows = false
lighting.FogStart = 0
lighting.FogEnd = 0
lighting.Brightness = 0
settings().Rendering.QualityLevel = "Level01"

for i, v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    end
end

for i, e in pairs(lighting:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
  	end    
})

Tab:AddButton({
	Name = "Visual Hoverboards",
	Callback = function()
local sex1 = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()
  sex1.Hoverboards = {}
for i,v in pairs(game:GetService("ReplicatedStorage")["__DIRECTORY"].Hoverboards:GetChildren())do
    if v:IsA("Folder") then
     table.insert(sex1.Hoverboards, v.Name)
    end
end
getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
    getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Equip = function(board)
      sex1.EquippedHoverboard = board
    getsenv(game.Players.LocalPlayer.PlayerScripts.Scripts.GUIs.Hoverboards).Update()
end
  	end    
})

Tab:AddSlider({
	Name = "Slider",
	Min = 1,
	Max = 250,
	Default = 24,
	Color = Color3.fromRGB(10, 24, 36),
	Increment = 1,
	ValueName = "speed",
	Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})

Tab:AddSlider({
	Name = "Slider",
	Min = 1,
	Max = 250,
	Default = 24,
	Color = Color3.fromRGB(10, 24, 36),
	Increment = 1,
	ValueName = "jump",
	Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end    
})

local Tab = Window:MakeTab({
	Name = "Fake Tags",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Basic Settings",
	Callback = function()
Rank = PartnerRank
Message = "SIGNING HUGES TRADE ME"
SpamTime = 10
Username = game.Players.LocalPlayer.DisplayName
end    
})

Tab:AddDropdown({
	Name = "Rank Picker",
	Default = "Partner",
	Options = {"Partner","Developer","Moderator","Leaderboard"},
	Callback = function(Value)
if Value == 'Partner' then
            Rank = PartnerRank
        elseif Value == 'Developer' then
            Rank = DeveloperRank
        elseif Value == 'Moderator' then
            Rank = ModeratorRank
        elseif Value == 'Leaderboard' then
            Rank = LeaderboardRank
        elseif Value == 'Signer' then
            Rank = SignerRank
        end
	end    

})
	  
Tab:AddTextbox({
	Name = "FAKE Username",
	Default = "",
	TextDisappear = true,
	Callback = function(User)
Username = User
	end	  
})

Tab:AddTextbox({
	Name = "Message",
	Default = "",
	TextDisappear = true,
	Callback = function(Text)
Message = Text
	end	  
})

Tab:AddButton({
	Name = "Send Message",
	Callback = function()
        if Rank and Message then -- Check that Rank and Message have been properly assigned values
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(""..PlayerMessage.."["..Wow.."] ["..Rank.."] ["..Username.."]: "..Message, "All")
        end
  	end    
})

Tab:AddSlider({
	Name = "Spam Speed",
	Min = 1,
	Max = 60,
	Default = 10,
	Color = Color3.fromRGB(10, 24, 36),
	Increment = 1,
	ValueName = "Seconds",
	Callback = function(Value)
SpamTime = (Value)
	end    
})

Tab:AddToggle({
	Name = "Message Spam",
	Default = false,
	Callback = function(Value)
  task.spawn(function()
  getgenv().toggleLoop = Value
  while getgenv().toggleLoop and task.wait() do
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(""..Wow.."["..Rank.."] ["..Username.."]: "..Message.."", "All")
wait(SpamTime)
end
end)
	end    
})

Tab:AddButton({
	Name = "Serverhop (big servers)",
	Callback = function()
local function serverhop()
            print("Server hop is triggered")
            local response = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=50"))
            if response and response["data"] then
                for i, v in pairs(response["data"]) do
                    if v["playing"] ~= v["maxPlayers"] then
                        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v["id"])
                        break
                    end
                end
            else
                print("Error: failed to decode JSON response or missing data field.")
            end
        end
        while true do
wait(0.1)
        serverhop()
       end
  	end    
})

Tab:AddButton({
	Name = "Serverhop (small servers)",
	Callback = function()
local function serverhop1()
            print("Server hop is triggered")
            local response = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=50"))
            if response and response["data"] then
                for i, v in pairs(response["data"]) do
                    if v["playing"] ~= v["maxPlayers"] then
                        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v["id"])
                        break
                    end
                end
            else
                print("Error: failed to decode JSON response or missing data field.")
            end
        end
        while true do
wait(0.1)
        serverhop1()
       end
  	end    
})


local Tab = Window:MakeTab({
	Name = "For Devs (ignore)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "print",
	Callback = function()
print("Rank is "..Rank.."")
print("Space is "..Wow.."")
print("Username is "..Username.."")
print("dummy message is "..Message.."")
print("your message is "..PlayerMessage.."")
print("spam speed is "..SpamTime.."")
  	end    
})