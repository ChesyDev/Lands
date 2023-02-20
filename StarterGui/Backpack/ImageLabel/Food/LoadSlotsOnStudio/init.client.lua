local everyFive = 0
local y = 0
for i = 1,40 do
	if everyFive == 5 then
		everyFive = 0
		y = y + 0.112
	end
	local bps = game.StarterGui.Backpack.ImageLabel.Item.LoadSlotsOnStudio.BackpackSlot:Clone()
	bps.Parent = game.StarterGui.Backpack.ImageLabel.Item
	bps.Name = i
	bps.Position = UDim2.new(everyFive * 0.195, 0, y, 0)
	everyFive = everyFive + 1
end
local everyFive = 0
local y = 0
for i = 1,40 do
	if everyFive == 5 then
		everyFive = 0
		y = y + 0.112
	end
	local bps = game.StarterGui.Backpack.ImageLabel.Item.LoadSlotsOnStudio.BackpackSlot:Clone()
	bps.Parent = game.StarterGui.Backpack.ImageLabel.KeyItem
	bps.Name = i
	bps.Position = UDim2.new(everyFive * 0.195, 0, y, 0)
	everyFive = everyFive + 1
end
local everyFive = 0
local y = 0
for i = 1,40 do
	if everyFive == 5 then
		everyFive = 0
		y = y + 0.112
	end
	local bps = game.StarterGui.Backpack.ImageLabel.Item.LoadSlotsOnStudio.BackpackSlot:Clone()
	bps.Parent = game.StarterGui.Backpack.ImageLabel.Equipments
	bps.Name = i
	bps.Position = UDim2.new(everyFive * 0.195, 0, y, 0)
	everyFive = everyFive + 1
end
local everyFive = 0
local y = 0
for i = 1,40 do
	if everyFive == 5 then
		everyFive = 0
		y = y + 0.112
	end
	local bps = game.StarterGui.Backpack.ImageLabel.Item.LoadSlotsOnStudio.BackpackSlot:Clone()
	bps.Parent = game.StarterGui.Backpack.ImageLabel.Artifacts
	bps.Name = i
	bps.Position = UDim2.new(everyFive * 0.195, 0, y, 0)
	everyFive = everyFive + 1
end

--For Remove
local p = {game.StarterGui.Backpack.ImageLabel.Artifacts:GetChildren(), game.StarterGui.Backpack.ImageLabel.Item:GetChildren(), game.StarterGui.Backpack.ImageLabel.KeyItem:GetChildren(), game.StarterGui.Backpack.ImageLabel.Equipments:GetChildren()}
for i,v in pairs(p[1]) do
	if v:IsA("TextButton") and v:FindFirstChild("ItemImage") then
		v:Destroy()
	end
end

for i,v in pairs(p[2]) do
	if v:IsA("TextButton") and v:FindFirstChild("ItemImage") then
		v:Destroy()
	end
end

for i,v in pairs(p[3]) do
	if v:IsA("TextButton") and v:FindFirstChild("ItemImage") then
		v:Destroy()
	end
end

for i,v in pairs(p[4]) do
	if v:IsA("TextButton") and v:FindFirstChild("ItemImage") then
		v:Destroy()
	end
end