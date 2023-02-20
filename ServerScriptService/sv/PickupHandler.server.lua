local ds = require(game:GetService("ServerScriptService").Modules.DataStore2)
local itemInfo = require(game:GetService("ReplicatedStorage").ItemInfo.ItemsInfo)

function getRealName(name)
	local dotPos = 0
	local stringTable = string.split(name, "")
	local realName = ""
	for i,v in pairs(stringTable) do
		if v == "." then
			break
		end
		realName = realName..v
	end
	return realName
end

game.ReplicatedStorage.rmt.pickup.OnServerEvent:Connect(function(p)
	local char = p.Character or p.CharacterAdded
	local hitm = char:WaitForChild("Hitm")
	if hitm.Value ~= nil then
		local itm = hitm.Value
		if itemInfo[itm.Name]["Weight"] + p.STATS.currentWeight.Value < p.STATS.maxWeight.Value then
			if (char.HumanoidRootPart.Position - itm.Position).magnitude <= 20 then
				local itmName = itm.Name
				local plr = p
				game:GetService("ReplicatedStorage").rmt.pickupClient:FireClient(p, itm)
				itm:Destroy()
				local backpackData = ds("backpack", plr)
				local itemType = itemInfo[itmName]["Type"]
				local id = 0
				local backpackTable = backpackData:Get()
				local dataCount = {["Item"] = 40, ["Food"] = 10, ["Equipment"] = 40, ["Tool"] = 40}

				for i = 1,dataCount[itemType] do
					local stringNum = tostring(i)
					if getRealName(backpackTable[itemType][stringNum]["Name"]) == "" then
						local tableName = itmName
						if id > 0 then
							tableName = itmName.."."..id
						end
						backpackTable[itemType][stringNum]["Name"] = tableName
						backpackTable[itemType][stringNum]["Quantity"] = backpackTable[itemType][stringNum]["Quantity"] + 1
						backpackTable[itemType][stringNum]["Stackable"] = itemInfo[itmName]["Stackable"]
						break
					elseif getRealName(backpackTable[itemType][stringNum]["Name"]) == itmName and backpackTable[itemType][stringNum]["Stackable"] == true then
						backpackTable[itemType][stringNum]["Quantity"] = backpackTable[itemType][stringNum]["Quantity"] + 1
						break
					else
						id = id + 1
					end
				end

				backpackData:Set(backpackTable)
				game:GetService("ReplicatedStorage").rmt.SUpdateBP:Fire(plr)
			end
		else
			--Send Backpack Full
		end
	end
end)