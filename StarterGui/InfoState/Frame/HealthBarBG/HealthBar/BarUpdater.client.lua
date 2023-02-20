local TS = game:GetService("TweenService")

game:GetService("RunService").Heartbeat:Connect(function()
	local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:wait()
	local hum = char:FindFirstChild("Humanoid")

	local tween = TS:Create(script.Parent, TweenInfo.new(.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(hum.Health / hum.MaxHealth, 0, 1, 0)})
	tween:Play()
end)