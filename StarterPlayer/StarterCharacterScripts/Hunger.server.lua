local char = script.Parent
local plr = game.Players:GetPlayerFromCharacter(char)
local i = 0
local food = plr:WaitForChild("STATS"):WaitForChild("Food")
food.Value = 100

while wait(2) do
	i = i + 1
	if food.Value > 0 and i == 3 then
		food.Value = food.Value - 1
		i = 0
	elseif food.Value <= 0 then
		char.Humanoid.Health = char.Humanoid.Health - 1
	end
end