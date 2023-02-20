local infoFrame = script.Parent.Parent.Parent.InfoFrame
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
	if script.Parent.ItemName.Text ~= "" then
		infoFrame.ItemFrame.Image = script.Parent.ItemImage.Image
		infoFrame.ItemFrame.ItemName.Text = script.Parent.ItemName.Text
		infoFrame.ItemFrame.ItemDesc.Text = itemInfo[getRealName(script.Parent.ItemName.Text)]["Desc"]
		infoFrame.ItemFrame.Quantity.Text = script.Parent.Quantity.Text
		infoFrame.ItemFrame.ID.Text = script.Parent.Parent.Name.."."..script.Parent.Name
	end
end)