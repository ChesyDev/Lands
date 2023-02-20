for i,v in pairs(game.StarterGui.Backpack.ImageLabel.Item:GetDescendants()) do
	if v.Name == "Quantity" then
		v.TextColor3 = Color3.fromRGB(255,255,255)
		v.TextStrokeColor3 = Color3.fromRGB(0,0,0)
		v.TextStrokeTransparency = 0
	end
	
	if v.Name == "ItemName" then
		v.Visible = false
	end
end