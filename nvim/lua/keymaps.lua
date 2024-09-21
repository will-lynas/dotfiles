local utils = require("utils")

local function toggle_guide()
	local width = "120"
	local cc_table = vim.opt.cc:get()
	utils.toggle_value_in_table(width, cc_table)
	vim.opt.cc = cc_table
end

local function toggle_wrap()
	vim.wo.wrap = not vim.wo.wrap
end

local function toggle_wrap_all()
	-- If any window is wrapped, unwrap them
	-- If no windows are wrapped, wrap them all

	local any_wrapped = false

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		vim.api.nvim_win_call(win, function()
			if vim.wo.wrap then
				any_wrapped = true
			end
		end)
		if any_wrapped then
			break
		end
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		vim.api.nvim_win_call(win, function()
			vim.wo.wrap = not any_wrapped
		end)
	end
end

local function open_new_tab_with_git_root()
	local git_root = utils.git_root_of_current_file()
	if git_root then
		vim.cmd("tabnew %")
		vim.cmd("tcd " .. git_root)
		vim.notify("Tab working directory set to " .. git_root, vim.log.levels.INFO)
	end
end

local function insert_date(format)
	local text = tostring(os.date(format))
	vim.api.nvim_put({ text }, "c", false, true)
end

-- Select text that was last pasted
vim.keymap.set("n", "gp", "`[v`]")

-- Move around lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Stop J moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page and searching keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pasting over highlighted area preserves buffer
vim.keymap.set("x", "<leader>kp", [["_dp]], { desc = "Paste" })
-- Delete without overwriting buffer
vim.keymap.set({ "n", "v" }, "<leader>kd", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>kD", [["_D]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sy", [["+y]])
vim.keymap.set("n", "<leader>sY", [["+Y]])
-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sp", [["+p]])
vim.keymap.set("n", "<leader>sP", [["+P]])
-- Delete to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sd", [["+d]])
vim.keymap.set("n", "<leader>sD", [["+D]])

vim.keymap.set("n", "<leader>sf", function()
	vim.cmd([[:let @+ = expand("%:p")]])
end, { desc = "Copy full path" })

-- Make current file executable
vim.keymap.set("n", "<leader>xf", "<cmd>!chmod +x %<CR>", { silent = true })

-- Stop highlighting after a search
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("noh")
end)

-- Run file with python
vim.keymap.set("n", "<leader>xp", function()
	vim.cmd("!python3 %")
end, { desc = "Python" })

-- Tab controls
vim.keymap.set("n", "<leader>in", function()
	vim.cmd("tabnew")
end, { desc = "New" })

vim.keymap.set("n", "<leader>iq", function()
	if #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd("tabclose")
	else
		vim.notify("Cannot close the last tab", vim.log.levels.ERROR)
	end
end, { desc = "Close" })

vim.keymap.set("n", "<M-1>", function()
	vim.cmd("silent! tabn 1")
end, { desc = "1" })
vim.keymap.set("n", "<M-2>", function()
	vim.cmd("silent! tabn 2")
end, { desc = "2" })
vim.keymap.set("n", "<M-3>", function()
	vim.cmd("silent! tabn 3")
end, { desc = "3" })
vim.keymap.set("n", "<M-4>", function()
	vim.cmd("silent! tabn 4")
end, { desc = "4" })

vim.keymap.set("n", "<leader>tc", toggle_guide, { desc = "Color Column" })
vim.keymap.set("n", "<leader>tw", toggle_wrap, { desc = "Wrap" })
vim.keymap.set("n", "<leader>ta", toggle_wrap_all, { desc = "Wrap All" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Diagnostic float" })

vim.keymap.set("n", "<leader>zo", require("lazy").home, { desc = "Open" })
vim.keymap.set("n", "<leader>zr", require("lazy").restore, { desc = "Restore" })

vim.keymap.set("n", "<leader>ad", function()
	insert_date("%Y-%m-%d")
end, { desc = "Date" })
vim.keymap.set("n", "<leader>at", function()
	insert_date("%H:%M:%S")
end, { desc = "Time" })
vim.keymap.set("n", "<leader>al", function()
	insert_date("%Y-%m-%d %H:%M:%S")
end, { desc = "Date and Time" })

vim.keymap.set("n", "<leader>ig", open_new_tab_with_git_root, { desc = "New Tab With Git Root" })

vim.keymap.set("n", "<leader>fj", "ggVG", { desc = "Select Whole Buffer" })
vim.keymap.set("n", "<leader>fm", function()
	vim.cmd("delmarks!")
end, { desc = "Delmarks" })

vim.keymap.set("n", "<leader>sc", function()
	vim.fn.setreg("+", vim.fn.getreg('"'))
	vim.notify('Copied " to +')
end, { desc = "Transfer to clipbord" })

vim.keymap.set("n", "<leader>fa", function()
	local handle = io.popen('gh run list --limit 1 --json url --jq ".[0].url"')
	if not handle then
		return
	end
	local url = handle:read("*a")
	handle:close()

	url = url:gsub("%s+", "")

	if url and url ~= "" then
		os.execute('open "' .. url .. '"')
	end
end, { desc = "Open last GH action in browser" })

vim.keymap.set("n", "<leader>fo", function()
	local f = io.open("browser_path", "r")
	if f then
		local url = f:read("*line")
		f:close()
		os.execute('open "' .. url .. '"')
		vim.notify("Opening " .. url, vim.log.levels.INFO)
	else
		vim.notify("'browser_path' file not found", vim.log.levels.ERROR)
	end
end, { desc = "Open link from browser_path" })
