local function toggle_guide()
	local utils = require("utils")
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

local function insert_date()
	local date_str = tostring(os.date("%Y-%m-%d"))
	vim.api.nvim_put({ date_str }, "c", false, true)
end

local function insert_time()
	local time_str = tostring(os.date("%H:%M:%S"))
	vim.api.nvim_put({ time_str }, "c", false, true)
end

local function insert_date_time()
	local date_time_str = tostring(os.date("%Y-%m-%d %H:%M:%S"))
	vim.api.nvim_put({ date_time_str }, "c", false, true)
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
	vim.cmd("tabclose")
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

vim.keymap.set("n", "<leader>ad", insert_date, { desc = "Date" })
vim.keymap.set("n", "<leader>at", insert_time, { desc = "Time" })
vim.keymap.set("n", "<leader>al", insert_date_time, { desc = "Date and Time" })
