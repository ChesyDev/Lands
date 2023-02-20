local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local mouse = require(ReplicatedStorage:WaitForChild("MouseModule")):GetMouse() 
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local CAS = game:GetService("ContextActionService")


--[[ the method of dragging here:
	under the script I have a tiny part called HoldGrip, its existence is only used to parent an attchment to it used for the AlignPosition (also parented to the part). 
	Whenever the mouse.Hit is changing and the mouse is clicking on something, I copy the HoldGrip and position at the calculated mouse position. A temporary attachment
	is added to the dragged object to connect it to the AlignPosition.
	I also set the ownership of the dragged part to the player, this makes the result very fluid and will work very well in a server scenario.
	Please use this for understanding and salvaging and not copy pasting! Note that I am using a mouse module of mine.
	You might've noticed that mouse.Move doesn't fire if the character moved, only if the mouse moved.
]]

--[[ settings for AlignPosition:
	MaxForce = 30000
	Responsiveness = 15
	
	these properties seemed to be perfect
]]

local HoldGrip = script.HoldGrip --holdgrip 
local attachment = Instance.new("Attachment")
local SetNetworkOwner = ReplicatedStorage:WaitForChild("SetNetworkOwner")
local GetNetworkOwner = ReplicatedStorage:WaitForChild("GetNetworkOwner")

local holdGrip
local target 
local hit
local bv
local pe
local DISTANCE = 10

local inputType = {Enum.UserInputType.MouseMovement}

mouse.Button1Down:connect(function() 
	target = mouse.Target
	hit = mouse.Hit

	if target and target.Name ~= "Workspace" and not(target.Anchored) and target.Parent == workspace.Item then -- not(target.Anchored) because when setting the ownership the part musn't be anchored
		if not GetNetworkOwner:InvokeServer(target) then -- this is important! and I only noticed it after a while. You should check if the network owner is the player already, because if you're too close to the part, you're already the owner, in which case the server switches the owner regardless of that
			SetNetworkOwner:FireServer(target) -- transfer ownership to plr
		end
		-- clone the HoldGrip and position it at first --
		holdGrip = HoldGrip:Clone()
		holdGrip.Position = character.Head.Position + ((mouse.Hit.Position - character.Head.Position).Unit * DISTANCE)
		holdGrip.Parent = workspace

		-- create attachment for dragged object and connect it --
		local attachment0 = attachment:Clone()
		attachment0.CFrame = target.CFrame:ToObjectSpace(hit)
		attachment0.Name = "DragAttachment"
		attachment0.Visible = false
		attachment0.Parent = target
		local gripAlignPosition = holdGrip.GripAlignPosition
		gripAlignPosition.Attachment0 = attachment0

		bv = Instance.new("BodyVelocity", target)
		bv.Velocity = Vector3.new(0,0,0)
		bv.MaxForce = Vector3.new(0,0,0)
		
		pe = Instance.new("ParticleEmitter", target)
		pe.Size = NumberSequence.new(0.2)
		pe.Transparency = NumberSequence.new(.5)
		pe.Lifetime = NumberRange.new(1)
		pe.Rate = 5
		pe.RotSpeed = NumberRange.new(10)
		pe.Speed = NumberRange.new(0)
		
		-- the magic --
		CAS:BindAction("draggingObjects", function(_, inputState, _)
			if inputState == Enum.UserInputState.Change then			
				holdGrip.Position = character.Head.Position + ((mouse.Hit.Position - character.Head.Position).Unit * DISTANCE)
			else 
				return
			end
		end, false, unpack(inputType))
	else
		target = nil
		hit = nil
	end
end)

-- cleanup after stopped dragging --
mouse.Button1Up:connect(function()	
	if target then
		local target_ = target
		target = nil
		hit = nil
		CAS:UnbindAction("draggingObjects")
		holdGrip:Destroy()
		holdGrip = nil
		bv:Destroy()
		bv = nil
		pe:Destroy()
		pe = nil
		target_.DragAttachment:Destroy()
		--[[ If you stopped dragging a part in mid-air, it will freeze for a bit due to the transfer of the ownership. You should instead make a check if it's still falling or not somehow. 
			 Using a wait is bad because if I re-dragged the part before the wait is done the entire time I'm re-dragging the owner is the server!
		]] 
		
		local part = script.Parent
		local rayDirection = Vector3.new(0, - 0.1, 0)
		local raycastResult = game:GetService("Workspace"):Raycast(target_.Position, rayDirection)

		if raycastResult then
			SetNetworkOwner:FireServer(target_) -- transfer ownership to server
		end
	end
end)

while task.wait() do
	local humanoid = character:WaitForChild("Humanoid")
	if humanoid.MoveDirection.X > 0 or humanoid.MoveDirection.X < 0 or humanoid.MoveDirection.Z > 0 or humanoid.MoveDirection.Z < 0 or humanoid.MoveDirection.Y > 0 or humanoid.MoveDirection.Y < 0 then
		if target then
			holdGrip.Position = character.Head.Position + ((mouse.Hit.Position - character.Head.Position).Unit * DISTANCE)
		end
	end
end