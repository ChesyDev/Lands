local hitm = script.Parent
while wait() do
	local obj = hitm.Value
	if obj then
		if not obj.Parent then
			hitm.Value = nil
		end
	end
end