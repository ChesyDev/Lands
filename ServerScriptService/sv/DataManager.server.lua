local ds = require(game:GetService("ServerScriptService").Modules.DataStore2)
local Players = game:GetService("Players")

ds.Combine("backpackDataTest002", "backpack")
ds.Combine("banTest002", "banned")

local backpackTable = {
	["Item"] = {
		["1"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["2"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["3"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["4"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["6"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["5"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["7"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["8"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["9"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["10"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["11"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["12"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["13"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["14"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["16"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["15"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["17"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["18"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["19"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["20"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["21"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["22"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["23"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["24"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["26"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["25"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["27"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["28"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["29"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["30"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["31"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["32"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["33"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["34"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["36"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["35"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["37"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["38"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["39"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["40"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true}
	},
	["Food"]= {
		["1"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["2"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["3"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["4"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["6"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["5"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["7"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["8"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["9"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true},
		["10"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = true}
	},
	["Equipment"] = {
		["1"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["2"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["3"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["4"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["6"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["5"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["7"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["8"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["9"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["10"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["11"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["12"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["13"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["14"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["16"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["15"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["17"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["18"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["19"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["20"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["21"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["22"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["23"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["24"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["26"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["25"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["27"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["28"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["29"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["30"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["31"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["32"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["33"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["34"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["36"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["35"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["37"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["38"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["39"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["40"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false}	
	},
	["Tool"] = {
		["1"] = {["Name"] = "Wood Pickaxe", ["Quantity"] = 1, ["Stackable"] = false},
		["2"] = {["Name"] = "Wood Axe", ["Quantity"] = 1, ["Stackable"] = false},
		["3"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["4"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["6"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["5"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["7"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["8"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["9"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["10"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["11"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["12"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["13"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["14"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["16"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["15"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["17"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["18"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["19"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["20"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["21"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["22"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["23"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["24"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["26"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["25"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["27"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["28"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["29"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["30"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["31"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["32"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["33"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["34"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["36"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["35"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["37"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["38"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["39"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false},
		["40"] = {["Name"] = "", ["Quantity"] = 0, ["Stackable"] = false}	
	}
}

Players.PlayerAdded:Connect(function(plr)
	local backpackStore = ds("backpack", plr)
	local banStore = ds("banned", plr)
	
	
	backpackStore:Get(backpackTable)
	banStore:Get(false)
	if banStore:Get(false) == true then
		plr:Kick("Perma-Banned due to exploiting.")
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	local backpackStore = ds("backpack", plr)
	local banStore = ds("banned", plr)
	--backpackStore:Set(backpackStore:Get(backpackTable))
end)