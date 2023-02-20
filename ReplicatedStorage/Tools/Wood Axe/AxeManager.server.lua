local tool = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local chopAnim = ReplicatedStorage.Animations.ChopAnim
local chopping = false
local rr3 = require(game:GetService("ServerScriptService").Modules.RotatedRegion3)
local isHolding = false

function waitFrame(frames)
	for i = 1, frames do
		task.wait()
	end
end

function shakeObj(mdl)
	local originalCF = mdl.OriginalCF.CFrame
	if mdl and mdl.PrimaryPart ~= nil then
		mdl:SetPrimaryPartCFrame(originalCF * CFrame.new(.1,0,0))
	end
	wait(.05)
	if mdl and mdl.PrimaryPart ~= nil then
		mdl:SetPrimaryPartCFrame(originalCF)
	end
	wait(.05)
	if mdl and mdl.PrimaryPart ~= nil then
		mdl:SetPrimaryPartCFrame(originalCF * CFrame.new(-.1,0,0))
	end
	wait(.05)
	if mdl and mdl.PrimaryPart ~= nil then
		mdl:SetPrimaryPartCFrame(originalCF)
	end
end

tool.Activated:Connect(function()
	isHolding = true
end)

tool.Deactivated:Connect(function()
	isHolding = false
end)

while task.wait() do
	if not script.Parent then return end
	local char = script.Parent.Parent
	local plr = game.Players:GetPlayerFromCharacter(char)
	if not chopping and isHolding then
		chopping = true
		local anim = char.Humanoid:LoadAnimation(chopAnim)
		anim:Play()
		waitFrame(23)
		local region = rr3.Block(char.HumanoidRootPart.CFrame * CFrame.new(0,-1,0), Vector3.new(4.5,4,5.5))
		coroutine.resume(coroutine.create(function()
			for i,v in pairs(region:FindPartsInRegion3WithIgnoreList(char:GetChildren(), math.huge)) do
				coroutine.resume(coroutine.create(function()
					if v:FindFirstChild("Axe") then
						local detector = v:FindFirstChild("Axe")
						local obj = v.Parent
						if detector:isA("BoolValue") then
							obj.Info.CurrentHP.Value = obj.Info.CurrentHP.Value - 1
							obj.Info.CurrentHP.loseher.Value = plr.Name
							char.Tobj.Value = obj
							char.Tobj.Past.Value = 3
							shakeObj(obj)
						end
					end
				end))
			end
		end))
		waitFrame(12)
		chopping = false
	end
end