local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local plr = game.Players.LocalPlayer
local playerGui = plr.PlayerGui

coroutine.resume(coroutine.create(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if #playerGui:GetChildren() == #game:GetService("StarterGui"):GetChildren() + 3 then
			
		else
			game:GetService("ReplicatedStorage").rmt.Dropltem:FireServer()
			wait()
			local Message = "ID: 01227 - Exploit Detected. You have been banned permanently."
			plr:Kick(Message)
		end
	end)
end))

local function toggleGui(actionName, inputState, inputObject)
	if actionName == "OpenBackpack" then
		if inputState == Enum.UserInputState.Begin then
			if playerGui.Backpack.Enabled == true then
				playerGui.Backpack.Enabled = false
			else
				playerGui.Backpack.Enabled = true
			end
		end
	elseif actionName == "OpenCraft" then
		if inputState == Enum.UserInputState.Begin then
			if playerGui.Crafting.Enabled == true then
				playerGui.Crafting.Enabled = false
			else
				playerGui.Crafting.Enabled = true
			end
		end
	end
	
	
end

local ContextActionService = game:GetService("ContextActionService")
ContextActionService:BindAction("OpenBackpack", toggleGui, false, Enum.KeyCode.B)
ContextActionService:BindAction("OpenCraft", toggleGui, false, Enum.KeyCode.C)