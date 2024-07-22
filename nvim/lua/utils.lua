local M = {}

function M.join_arrays(t1, t2)
	local result = {}

	for i = 1, #t1 do
		result[#result + 1] = t1[i]
	end

	for i = 1, #t2 do
		result[#result + 1] = t2[i]
	end

	return result
end

function M.index(seq, elem)
	for i, v in ipairs(seq) do
		if v == elem then
			return i
		end
	end

	return nil
end

function M.toggle_value_in_table(value, t)
	local i = M.index(t, value)

	if i then
		table.remove(t, i)
	else
		table.insert(t, value)
	end
end

return M
