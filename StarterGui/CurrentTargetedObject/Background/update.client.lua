local maxFrame = script.Parent.Max
local hpFrame = maxFrame.HP
local displayHP = script.Parent.DisplayHP
local displayName = script.Parent.Parent.DisplayName

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()
local tobj = char:WaitForChild("Tobj")

game:GetService("RunService").Heartbeat:Connect(function()
	if tobj.Value ~= nil then
		local obj = tobj.Value
		local info = obj:FindFirstChild("Info")
		if info then
			local currentHP = info.CurrentHP.Value
			local maxHP = info.MaxHP.Value
			hpFrame.Size = UDim2.new(currentHP / maxHP, 0, 1, 0)
			displayHP.Text = tostring(currentHP)
			displayName.Text = obj.Name
			script.Parent.Visible = true
			displayName.Visible = true
		end
	elseif tobj.Value == nil then
		script.Parent.Visible = false
		displayName.Visible = false
	end
end)