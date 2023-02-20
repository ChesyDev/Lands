local sp = script.Parent
local tool = sp.Tool
local equipment = sp.Equipment
local item = sp.Item
local food = sp.Food

sp.ToolTab.ImageButton.MouseButton1Click:Connect(function()
	tool.Visible = true
	equipment.Visible = false
	item.Visible = false
	food.Visible = false
end)

sp.EquipmentTab.ImageButton.MouseButton1Click:Connect(function()
	tool.Visible = false
	equipment.Visible = true
	item.Visible = false
	food.Visible = false
end)

sp.ItemTab.ImageButton.MouseButton1Click:Connect(function()
	tool.Visible = false
	equipment.Visible = false
	item.Visible = true
	food.Visible = false
end)

sp.FoodTab.ImageButton.MouseButton1Click:Connect(function()
	tool.Visible = false
	equipment.Visible = false
	item.Visible = false
	food.Visible = true
end)