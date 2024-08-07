local M = {}

---@param t1 any[]
---@param t2 any[]
---@return any[]
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

---@param seq any[]
---@param elem any
---@return integer?
function M.index(seq, elem)
	for i, v in ipairs(seq) do
		if v == elem then
			return i
		end
	end

	return nil
end

---@param value any
---@param t any[]
function M.toggle_value_in_table(value, t)
	local i = M.index(t, value)

	if i then
		table.remove(t, i)
	else
		table.insert(t, value)
	end
end

---@class GitRootArgs
---@field filepath string?
---@field notify boolean?

---@param args GitRootArgs
---@return string?
function M.get_git_root(args)
	local notify = args.notify ~= false
	local path = vim.fn.fnamemodify(args.filepath or "", ":h")

	local command = string.format("git -C %s rev-parse --show-toplevel 2>/dev/null", path)
	local handle = assert(io.popen(command))
	local git_root = handle:read("*a"):gsub("\n", "")
	handle:close()

	if git_root ~= "" then
		return git_root
	elseif notify then
		vim.notify("File is not in a git repo", vim.log.levels.ERROR)
	end
end

---@param notify boolean?
---@return string?
function M.git_root_of_current_file(notify)
	local filepath = vim.fn.expand("%:p")
	return M.get_git_root({ filepath = filepath, notify = notify ~= false })
end

return M
