local ds = require(game:GetService("ServerScriptService").Modules.DataStore2)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

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

function getRealID(ID)
	local dotPos = 0
	local stringTable = string.split(ID, "")
	local realID = ""
	local realPos = ""
	for i,v in pairs(stringTable) do
		if v == "." then
			break
		end
		if v ~= "s" then
			realID = realID..v
		end
	end
	
	local afterDot = false
	for i,v in pairs(stringTable) do
		if afterDot then
			realPos = realPos..v
		end
		if v == "." then
			afterDot = true
		end
	end
	return realID, realPos
end

function updateBP(p)
	local backpackData = ds("backpack", p)
	local backpackTable = backpackData:Get()
	local backpackGui = p.PlayerGui:WaitForChild("Backpack").ImageLabel
	local itemInfo = require(ReplicatedStorage.ItemInfo.ItemsInfo)
	local emptyItem
	local emptyFood
	local emptyEquipment
	local emptyTool
	local weight = 0
	
	--Need to add if quantity is 0 then empty the slot and put everything infront
	--Check if there is <= 0 quantity item frame if there is then set variable to item frame id
	for i = 1,40 do
		local stringNum = tostring(i)
		if backpackTable["Item"][stringNum] ~= nil then
			if backpackTable["Item"][stringNum]["Name"] ~= "" and backpackTable["Item"][stringNum]["Quantity"] <= 0 then
				emptyItem = tonumber(stringNum)
			end
		end
		
		if backpackTable["Food"][stringNum] ~= nil then
			if backpackTable["Food"][stringNum]["Name"] ~= "" and backpackTable["Food"][stringNum]["Quantity"] <= 0 then
				emptyFood = tonumber(stringNum)
			end
		end
		
		if backpackTable["Equipment"][stringNum] ~= nil then
			if backpackTable["Equipment"][stringNum]["Name"] ~= "" and backpackTable["Equipment"][stringNum]["Quantity"] <= 0 then
				emptyEquipment = tonumber(stringNum)
			end
		end
		
		if backpackTable["Tool"][stringNum] ~= nil then
			if backpackTable["Tool"][stringNum]["Name"] ~= "" and backpackTable["Tool"][stringNum]["Quantity"] <= 0 then
				emptyTool = tonumber(stringNum)
			end
		end
	end
	
	-- if empty variable is not nil then rearrange their order
	if emptyItem ~= nil then
		for i = emptyItem, 39 do
			local stringNum = tostring(i)
			local copyNum = tostring(i+1)
			backpackTable["Item"][stringNum]["Name"] = backpackTable["Item"][copyNum]["Name"]
			backpackTable["Item"][stringNum]["Quantity"] = backpackTable["Item"][copyNum]["Quantity"]
			backpackTable["Item"][stringNum]["Stackable"] = backpackTable["Item"][copyNum]["Stackable"]
		end
	end
	
	if emptyFood ~= nil then
		for i = emptyFood, 9 do
			local stringNum = tostring(i)
			local copyNum = tostring(i+1)
			backpackTable["Food"][stringNum]["Name"] = backpackTable["Food"][copyNum]["Name"]
			backpackTable["Food"][stringNum]["Quantity"] = backpackTable["Food"][copyNum]["Quantity"]
			backpackTable["Food"][stringNum]["Stackable"] = backpackTable["Food"][copyNum]["Stackable"]
		end
	end
	
	if emptyEquipment ~= nil then
		for i = emptyEquipment, 39 do
			local stringNum = tostring(i)
			local copyNum = tostring(i+1)
			backpackTable["Equipment"][stringNum]["Name"] = backpackTable["Equipment"][copyNum]["Name"]
			backpackTable["Equipment"][stringNum]["Quantity"] = backpackTable["Equipment"][copyNum]["Quantity"]
			backpackTable["Equipment"][stringNum]["Stackable"] = backpackTable["Equipment"][copyNum]["Stackable"]
		end
	end
	
	if emptyTool ~= nil then
		for i = emptyTool, 39 do
			local stringNum = tostring(i)
			local copyNum = tostring(i+1)
			backpackTable["Tool"][stringNum]["Name"] = backpackTable["Tool"][copyNum]["Name"]
			backpackTable["Tool"][stringNum]["Quantity"] = backpackTable["Tool"][copyNum]["Quantity"]
			backpackTable["Tool"][stringNum]["Stackable"] = backpackTable["Tool"][copyNum]["Stackable"]
		end
	end
	
	--^^ Fixes items order/arrangement in backpack gui
	
	backpackData:Set(backpackTable)
	
	for i = 1,40 do
		local stringNum = tostring(i)
		--Viewport Item Section
		if backpackGui.Item:FindFirstChild(stringNum) then
			local name = getRealName(backpackTable["Item"][stringNum]["Name"])
			backpackGui.Item[stringNum].ItemName.Text = name --getRealName(backpackTable["Item"][stringNum]["Name"])
			backpackGui.Item[stringNum].Quantity.Text = backpackTable["Item"][stringNum]["Quantity"]
			if backpackGui.Item[stringNum].Quantity.Text == "0" then
				backpackGui.Item[stringNum].Quantity.Visible = false
				for i,v in pairs(backpackGui.Item[stringNum].ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end
			elseif backpackGui.Item[stringNum].Quantity.Text ~= "0" then
				weight = weight + (itemInfo[name]["Weight"] * tonumber(backpackGui.Item[stringNum].Quantity.Text))
				backpackGui.Item[stringNum].Quantity.Visible = true
				
				if game:GetService("ReplicatedStorage").Items:FindFirstChild(name) then
					local itemClone = game:GetService("ReplicatedStorage").Items[name]:Clone()
					itemClone.Parent = backpackGui.Item[stringNum].ViewportFrame.WorldModel
					itemClone.CFrame = CFrame.new(Vector3.new(0,0,0))
					
					for i,v in pairs(backpackGui.Item[stringNum].ViewportFrame.WorldModel:GetChildren()) do
						if v.Name ~= name and v.Name ~= "Camera" then
							v:Destroy()
						end
					end
				end
			end

			if backpackGui.Item[stringNum].ItemName.Text == "" then --getRealName(backpackTable["Item"][stringNum]["Name"])
				backpackGui.Item[stringNum].BackgroundCircle.Visible = false
			else
				backpackGui.Item[stringNum].BackgroundCircle.Visible = true
			end
		end
		--Viewport Food Section
		if backpackGui.Food:FindFirstChild(stringNum) then
			local name = getRealName(backpackTable["Food"][stringNum]["Name"])
			backpackGui.Food[stringNum].ItemName.Text = name --getRealName(backpackTable["Item"][stringNum]["Name"])
			backpackGui.Food[stringNum].Quantity.Text = backpackTable["Food"][stringNum]["Quantity"]
			if backpackGui.Food[stringNum].Quantity.Text == "0" then
				backpackGui.Food[stringNum].Quantity.Visible = false
				for i,v in pairs(backpackGui.Food[stringNum].ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end
			elseif backpackGui.Food[stringNum].Quantity.Text ~= "0" then
				weight = weight + (itemInfo[name]["Weight"] * tonumber(backpackGui.Food[stringNum].Quantity.Text))
				backpackGui.Food[stringNum].Quantity.Visible = true

				if game:GetService("ReplicatedStorage").Items:FindFirstChild(name) then
					local itemClone = game:GetService("ReplicatedStorage").Items[name]:Clone()
					itemClone.Parent = backpackGui.Food[stringNum].ViewportFrame.WorldModel
					itemClone.CFrame = CFrame.new(Vector3.new(0,0,0))

					for i,v in pairs(backpackGui.Food[stringNum].ViewportFrame.WorldModel:GetChildren()) do
						if v.Name ~= name and v.Name ~= "Camera" then
							v:Destroy()
						end
					end
				end
			end

			if backpackGui.Food[stringNum].ItemName.Text == "" then --getRealName(backpackTable["Item"][stringNum]["Name"])
				backpackGui.Food[stringNum].BackgroundCircle.Visible = false
			else
				backpackGui.Food[stringNum].BackgroundCircle.Visible = true
			end
		end
		--Viewport Equipment Section
		if backpackGui.Equipment:FindFirstChild(stringNum) then
			local name = getRealName(backpackTable["Equipment"][stringNum]["Name"])
			backpackGui.Equipment[stringNum].ItemName.Text = name --getRealName(backpackTable["Item"][stringNum]["Name"])
			backpackGui.Equipment[stringNum].Quantity.Text = backpackTable["Equipment"][stringNum]["Quantity"]
			if backpackGui.Equipment[stringNum].Quantity.Text == "0" then
				backpackGui.Equipment[stringNum].Quantity.Visible = false
				for i,v in pairs(backpackGui.Equipment[stringNum].ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end
			elseif backpackGui.Equipment[stringNum].Quantity.Text ~= "0" then
				weight = weight + (itemInfo[name]["Weight"] * tonumber(backpackGui.Equipment[stringNum].Quantity.Text))
				backpackGui.Equipment[stringNum].Quantity.Visible = true

				if game:GetService("ReplicatedStorage").Equipment:FindFirstChild(name) then
					local itemClone = game:GetService("ReplicatedStorage").Equipment[name]:Clone()
					itemClone.Parent = backpackGui.Equipment[stringNum].ViewportFrame.WorldModel
					itemClone.CFrame = CFrame.new(Vector3.new(0,0,0))

					for i,v in pairs(backpackGui.Equipment[stringNum].ViewportFrame.WorldModel:GetChildren()) do
						if v.Name ~= name and v.Name ~= "Camera" then
							v:Destroy()
						end
					end
				end
			end

			if backpackGui.Equipment[stringNum].ItemName.Text == "" then --getRealName(backpackTable["Item"][stringNum]["Name"])
				backpackGui.Equipment[stringNum].BackgroundCircle.Visible = false
			else
				backpackGui.Equipment[stringNum].BackgroundCircle.Visible = true
			end
		end
		--Viewport Tool Section
		if backpackGui.Tool:FindFirstChild(stringNum) then
			local name = getRealName(backpackTable["Tool"][stringNum]["Name"])
			backpackGui.Tool[stringNum].ItemName.Text = name --getRealName(backpackTable["Item"][stringNum]["Name"])
			backpackGui.Tool[stringNum].Quantity.Text = backpackTable["Tool"][stringNum]["Quantity"]
			if backpackGui.Tool[stringNum].Quantity.Text == "0" then
				backpackGui.Tool[stringNum].Quantity.Visible = false
				for i,v in pairs(backpackGui.Tool[stringNum].ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end
			elseif backpackGui.Tool[stringNum].Quantity.Text ~= "0" then
				weight = weight + (itemInfo[name]["Weight"] * tonumber(backpackGui.Tool[stringNum].Quantity.Text))
				backpackGui.Tool[stringNum].Quantity.Visible = true

				if game:GetService("ReplicatedStorage").Items:FindFirstChild(name) then
					local itemClone = game:GetService("ReplicatedStorage").Items[name]:Clone()
					itemClone.Parent = backpackGui.Tool[stringNum].ViewportFrame.WorldModel
					itemClone.CFrame = CFrame.new(Vector3.new(0,0,0))

					for i,v in pairs(backpackGui.Tool[stringNum].ViewportFrame.WorldModel:GetChildren()) do
						if v.Name ~= name and v.Name ~= "Camera" then
							v:Destroy()
						end
					end
				end
			end

			if backpackGui.Tool[stringNum].ItemName.Text == "" then --getRealName(backpackTable["Item"][stringNum]["Name"])
				backpackGui.Tool[stringNum].BackgroundCircle.Visible = false
			else
				backpackGui.Tool[stringNum].BackgroundCircle.Visible = true
			end
		end
	end
	--Backpack Capacity/Weight Value
	p.STATS.currentWeight.Value = weight
end

--For dropping items
function spawnItem(itemName, p)
	local isItemHere = game:GetService("ReplicatedStorage").Items:FindFirstChild(itemName)
	local char = p.Character or p.CharacterAdded:wait()
	local hrp = char.HumanoidRootPart.CFrame + (char.HumanoidRootPart.CFrame.LookVector*3)
	if isItemHere then
		local itemClone = isItemHere:Clone()
		itemClone.Parent = workspace.Item
		itemClone.CFrame = hrp
	else
		warn(itemName.." not found. [Item]")
	end
end

--Remove Item from toolbar
function removeItem(itemName, p)
	local backpackData = ds("backpack", p)
	local backpackTable = backpackData:Get()
	local toolbarData = ds("toolbar", p)
	local toolbarTable = toolbarData:Get()
	local slotFound = false
	local toolbarGui = p.PlayerGui.Toolbar.Frame

	for i = 1, 6 do
		local id = tostring(i)
		if toolbarTable[id] == itemName then
			if p.Backpack:FindFirstChild(itemName) then
				for _,v in pairs(toolbarGui[id].ImageButton.ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end

				p.Backpack[itemName]:Destroy()
				toolbarTable[tostring(id)] = ""
				toolbarData:Set(toolbarTable)
			elseif p.Character:FindFirstChild(itemName) then
				for _,v in pairs(toolbarGui[tostring(id)].ImageButton.ViewportFrame.WorldModel:GetChildren()) do
					v:Destroy()
				end
				p.Character[itemName]:Destroy()
				toolbarTable[tostring(id)] = ""
				toolbarData:Set(toolbarTable)
			end
		end
	end
end

--Update Server Side Backpack (DataStore)
ReplicatedStorage.rmt.SUpdateBP.Event:Connect(function(p)
	updateBP(p)
end)

--Update Client To Server Backpack
ReplicatedStorage.rmt.UpdateBP.OnServerEvent:Connect(function(p)
	updateBP(p)
end)

--Drop Item Client To Server
ReplicatedStorage.rmt.DropItem.OnServerEvent:Connect(function(p, id)
	local realID, realPos = getRealID(id)
	local backpackData = ds("backpack", p)
	local backpackTable = backpackData:Get()
	if 1 <= backpackTable[realID][realPos]["Quantity"] and 1 > 0 then
		backpackTable[realID][realPos]["Quantity"] = backpackTable[realID][realPos]["Quantity"] - 1
		local itemName = getRealName(backpackTable[realID][realPos]["Name"])
		spawnItem(itemName, p)
		backpackData:Set(backpackTable)
		updateBP(p)
		removeItem(itemName, p)
	end
end)

--When item gets clicked in backpack gui (Usage)
ReplicatedStorage.rmt.UseItem.OnServerEvent:Connect(function(p, id)
	local realID, realPos = getRealID(id)
	local backpackData = ds("backpack", p)
	local backpackTable = backpackData:Get()
	local toolbarData = ds("toolbar", p)
	local toolbarTable = toolbarData:Get()
	local slotFound = false
	local toolbarGui = p.PlayerGui.Toolbar.Frame
	local itemsInfo = require(game:GetService("ReplicatedStorage").ItemInfo.ItemsInfo)
	if backpackTable[realID][realPos]["Name"] ~= "" then
		if realID == "Tool" then
			for i = 1, 6 do
				if toolbarTable[tostring(i)] == "" or toolbarTable[tostring(i)] == backpackTable[realID][realPos]["Name"] then
					toolbarTable[tostring(i)] = backpackTable[realID][realPos]["Name"]
					local name = getRealName(backpackTable[realID][realPos]["Name"])
					if game:GetService("ReplicatedStorage").Items:FindFirstChild(name) then
						if not p.Backpack:FindFirstChild(toolbarTable[tostring(i)]) and not p.Character:FindFirstChild(toolbarTable[tostring(i)]) then
							local toolClone = game:GetService("ReplicatedStorage").Tools[name]:Clone()
							toolClone.Name = toolbarTable[tostring(i)]
							toolClone.Parent = p.Backpack
							local itemClone = game:GetService("ReplicatedStorage").Items[name]:Clone()
							itemClone.Parent = toolbarGui[tostring(i)].ImageButton.ViewportFrame.WorldModel
							itemClone.CFrame = CFrame.new(Vector3.new(0,0,0))
							toolbarData:Set(toolbarTable)
						else
							if name ~= "" then
								removeItem(name, p)
							end
						end
					end
					slotFound = true
					return
				end
			end
			
			if slotFound == false then
				--Error Toolbar Slot
			end
		elseif realID == "Food" then
			local char = p.Character or p.CharacterAdded:wait()
			backpackTable[realID][realPos]["Quantity"] = backpackTable[realID][realPos]["Quantity"] - 1
			local newFood = math.clamp(p.STATS.Food.Value + itemsInfo[getRealName(backpackTable[realID][realPos]["Name"])]["Hunger"], 0, 100)
			local newHp = math.clamp(char.Humanoid.Health + itemsInfo[getRealName(backpackTable[realID][realPos]["Name"])]["Health"], 0, char.Humanoid.MaxHealth)
			p.STATS.Food.Value = newFood
			char.Humanoid.Health = newHp
			backpackData:Set(backpackTable)
			updateBP(p)
		end
	end
end)

--Equpping Tools from Toolbar
ReplicatedStorage.rmt.tbE.OnServerEvent:Connect(function(p, slot)
	local toolbarData = ds("toolbar", p)
	local toolbarTable = toolbarData:Get()
	local slotFound = false
	local toolbarGui = p.PlayerGui.Toolbar.Frame
	local char = p.Character or p.CharacterAdded:wait()
	if char.Humanoid.Health == nil then return end
	for i = 1,6 do
		local id = tostring(i)
		toolbarGui[id].BG.UIGradient.Enabled = false
	end
	if toolbarTable[slot] ~= "" then
		local name = getRealName(toolbarTable[slot])
		if not char:FindFirstChild(toolbarTable[slot]) then
			char.Humanoid:UnequipTools()
			char.Humanoid:EquipTool(p.Backpack:FindFirstChild(toolbarTable[slot]))
			toolbarGui[slot].BG.UIGradient.Enabled = true
		else
			char.Humanoid:UnequipTools()
		end
	else
		char.Humanoid:UnequipTools()
	end
end)