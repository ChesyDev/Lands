game:GetService("ReplicatedStorage").rmt.updCon.OnServerEvent:Connect(function(p, char, object)
	local hitm = char:FindFirstChild("Hitm")
	if hitm then
		hitm.Value = object
	end
end)