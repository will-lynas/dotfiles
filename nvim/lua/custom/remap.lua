vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Move around lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Stop J moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--Make a version of gJ that is actually useful
--Now it's like J but with no space, rather than just joining all the whitespace from indents
--This isn't very robust. Will break if used with empty line below.
vim.keymap.set("n", "<leader>j", "mzgJ`[diw`z")

--Half-page and searching keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Pasting over highlighted area preserves buffer
vim.keymap.set("x", "<leader>gp", [["_dP]])
--Delete without overwriting buffer
vim.keymap.set({"n", "v"}, "<leader>gd", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>gD", [["_D]])

--Note - when you perform actions on the system clipboard, the results also get
--stored in the normal buffers, overwriting them

--Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
--Paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>pp", [["+p]])
vim.keymap.set("n", "<leader>PP", [["+P]])
--Delete to system clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

--Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--Stop highlighted after a search
vim.keymap.set("n", "<leader>hl", function() vim.cmd("noh") end)
