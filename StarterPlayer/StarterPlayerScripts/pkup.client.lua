local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()
local hitm = char:WaitForChild("Hitm")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local mouse = plr:GetMouse()

UIS.InputBegan:Connect(function(key, proc)
	if proc then return end
	if key.KeyCode == Enum.KeyCode.F then
		if hitm.Value ~= nil then
			game:GetService("ReplicatedStorage").rmt.pickup:FireServer()
		end
	end
end)

game:GetService("ReplicatedStorage").rmt.pickupClient.OnClientEvent:Connect(function(itm)
	itm = itm:Clone()
	itm.Parent = workspace
	itm.CanCollide = false
	local tween = TS:Create(itm, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = char.HumanoidRootPart.Position, Size = itm.Size / 20})
	tween:Play()
	coroutine.resume(coroutine.create(function()
		for i,v in pairs(itm:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
				local tweens = TS:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = char.HumanoidRootPart.Position, Size = itm.Size / 20})
				tweens:Play()
			end
		end
	end))
	wait(.21)
	itm:Destroy()
	itm = nil
end)

game:GetService("RunService").Heartbeat:Connect(function()
	local target = mouse.Target
	local hit = mouse.Hit
	local targetFound = false
	if target and target.Name ~= "Workspace" and target.Parent == workspace.Item then
		if (char.HumanoidRootPart.Position - target.Position).magnitude <= 20 then
			if hitm.Value ~= target then
				game:GetService("ReplicatedStorage").rmt.updCon:FireServer(char, target)
				targetFound = true
			end
		elseif hitm.Value ~= nil then
			game:GetService("ReplicatedStorage").rmt.updCon:FireServer(char, nil)
		end
	elseif hitm.Value ~= nil then
		game:GetService("ReplicatedStorage").rmt.updCon:FireServer(char, nil)
	end
end)