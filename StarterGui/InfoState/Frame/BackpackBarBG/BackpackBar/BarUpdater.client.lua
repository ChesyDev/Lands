local TS = game:GetService("TweenService")

game:GetService("RunService").Heartbeat:Connect(function()
	local plr = game.Players.LocalPlayer
	local currentWeight = plr:WaitForChild("STATS").currentWeight
	local maxWeight = plr:WaitForChild("STATS").maxWeight

	local tween = TS:Create(script.Parent, TweenInfo.new(.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(currentWeight.Value / maxWeight.Value, 0, 1, 0)})
	tween:Play()
end)