while wait(1) do
	if script.Parent.Value > 0 then
		script.Parent.Value = script.Parent.Value - 1
	elseif script.Parent.Value <= 0 then
		script.Parent.Parent.Value = nil
	end
end