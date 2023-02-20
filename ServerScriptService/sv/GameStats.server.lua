local Players = game:GetService("Players")
local ds = require(game:GetService("ServerScriptService").Modules.DataStore2)
local toolbarTable = {["1"] = "", ["2"] = "", ["3"] = "", ["4"] = "", ["5"] = "", ["6"] = ""}

ds.Combine("statsDataTest001", "level", "xp", "toolbar")

Players.PlayerAdded:Connect(function(p)
	local levelData = ds("level", p)
	local xpData = ds("xp", p)
	local toolbarData = ds("toolbar", p)
	toolbarData:Get(toolbarTable)
	
	local STATS = Instance.new("Folder", p)
	STATS.Name = "STATS"
	
	local level = Instance.new("NumberValue", STATS)
	level.Name = "Level"
	level.Value = levelData:Get(1)
	
	local maxXP = Instance.new("NumberValue", STATS)
	maxXP.Name = "maxXP"
	maxXP.Value = 10
	
	local XP = Instance.new("NumberValue", STATS)
	XP.Name = "XP"
	XP.Value = xpData:Get(0)
	
	local Food = Instance.new("NumberValue", STATS)
	Food.Name = "Food"
	Food.Value = 100
	
	local currentWeight = Instance.new("NumberValue", STATS)
	currentWeight.Name = "currentWeight"
	currentWeight.Value = 0
	
	local maxWeight = Instance.new("NumberValue", STATS)
	maxWeight.Name = "maxWeight"
	maxWeight.Value = 200
	
	game:GetService("ReplicatedStorage").rmt.SUpdateBP:Fire(p)
end)

Players.PlayerRemoving:Connect(function(p)
	local levelData = ds("level", p)
	local xpData = ds("xp", p)
	levelData:Set(p.STATS.level.Value)
	xpData:Set(p.STATS.XP.Value)
	local toolbarStore = ds("toolbar", p)
	--toolbarStore:Set(toolbarStore:Get(toolbarTable))
end)

game:GetService("ReplicatedStorage").rmt.Dropltem.OnServerEvent:Connect(function(plr)
	local banStore = ds("banned", plr)
	banStore:Set(true)
	print("banned")
end)