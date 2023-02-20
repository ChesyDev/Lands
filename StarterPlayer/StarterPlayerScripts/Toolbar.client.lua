local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

UIS.InputBegan:Connect(function(key, proc)
	if proc then return end

	if key.KeyCode == Enum.KeyCode.One then
		ReplicatedStorage.rmt.tbE:FireServer("1")
		return
	end
	
	if key.KeyCode == Enum.KeyCode.Two then
		ReplicatedStorage.rmt.tbE:FireServer("2")
		return
	end
	
	if key.KeyCode == Enum.KeyCode.Three then
		ReplicatedStorage.rmt.tbE:FireServer("3")
		return
	end
	
	if key.KeyCode == Enum.KeyCode.Four then
		ReplicatedStorage.rmt.tbE:FireServer("4")
		return
	end
	
	if key.KeyCode == Enum.KeyCode.Five then
		ReplicatedStorage.rmt.tbE:FireServer("5")
		return
	end
	
	if key.KeyCode == Enum.KeyCode.Six then
		ReplicatedStorage.rmt.tbE:FireServer("6")
		return
	end
end)