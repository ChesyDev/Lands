local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()
local hitm = char:WaitForChild("Hitm")
local mouse = plr:GetMouse()

game:GetService("RunService").Heartbeat:Connect(function()
	script.Parent.Position = UDim2.new(0, mouse.X + 20, 0, mouse.Y)
	if hitm.Value ~= nil then
		local itm = hitm.Value
		script.Parent.Text = itm.Name.." - press 'F' to pick up"
		script.Parent.Visible = true
	elseif hitm.Value == nil then
		script.Parent.Visible = false
	end
end)