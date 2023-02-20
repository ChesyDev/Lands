local reward = {{"Stone", 2}, {"XP", 1}}
local primaryPart = script.Parent.Parent.PrimaryPart

function spawnItem(itemName)
	local isItemHere = game:GetService("ReplicatedStorage").Items:FindFirstChild(itemName)
	if isItemHere then
		local itemClone = isItemHere:Clone()
		itemClone.Parent = workspace.Item
		itemClone.CFrame = primaryPart.CFrame + Vector3.new((math.random(-40,40)/10), (math.random(0,20)/10), (math.random(-40,40)/10))
	else
		warn(itemName.." not found. [Item]")
	end
end

script.Parent.CurrentHP.Changed:Connect(function(hp)
	if hp <= 0 then
		local loseher = script.Parent.CurrentHP.loseher.Value
		local loseherPlayer = game.Players:FindFirstChild(loseher)
		wait()
		coroutine.resume(coroutine.create(function()
			for i,v in pairs(reward) do
				if v[1] ~= "XP" then
					coroutine.resume(coroutine.create(function()
						for i = 1, v[2] do
							coroutine.resume(coroutine.create(function()
								spawnItem(v[1])
							end))
						end						
					end))
				elseif v[1] == "XP" then
					loseherPlayer.STATS.XP.Value = loseherPlayer.STATS.XP.Value + v[2]
				end
			end
		end))
		script.Parent.Parent:Destroy()
	end
end)