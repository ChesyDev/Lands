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

script.Parent.MouseButton1Click:Connect(function()
	if script.Parent.ItemName.Text ~= "" and script.Parent.Parent.Name ~= "Item" then
		game:GetService("ReplicatedStorage").rmt.UseItem:FireServer(script.Parent.Parent.Name.."."..script.Parent.Name)
	end
end)

script.Parent.MouseButton2Click:Connect(function()
	if script.Parent.ItemName.Text ~= "" then
		game:GetService("ReplicatedStorage").rmt.DropItem:FireServer(script.Parent.Parent.Name.."."..script.Parent.Name)
	end
end)