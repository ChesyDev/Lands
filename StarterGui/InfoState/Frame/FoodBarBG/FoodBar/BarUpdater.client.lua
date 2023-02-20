local TS = game:GetService("TweenService")

game:GetService("RunService").Heartbeat:Connect(function()
	local plr = game.Players.LocalPlayer
	local Food = plr:WaitForChild("STATS").Food
	
	local tween = TS:Create(script.Parent, TweenInfo.new(.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(Food.Value / 100, 0, 1, 0)})
	tween:Play()
end)