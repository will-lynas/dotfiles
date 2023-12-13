vim.keymap.set("n", "<leader>vp", vim.cmd.Ex)

--Move around lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Stop J moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--Make a version of gJ that is actually useful
--Now it's like J but with no space, rather than just joining all the whitespace from indents
--This isn't very robust. Will break if used with empty line below.
vim.keymap.set("n", "<leader>j", "mzJ`[diw`z")

--Half-page and searching keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Pasting over highlighted area preserves buffer
vim.keymap.set("x", "<leader>kp", [["_dp]])
--Delete without overwriting buffer
vim.keymap.set({"n", "v"}, "<leader>kd", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>kD", [["_D]])

--Note - when you perform actions on the system clipboard, the results also get
--stored in the normal buffers, overwriting them

--Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>sy", [["+y]])
vim.keymap.set("n", "<leader>sY", [["+Y]])
--Paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>sp", [["+p]])
vim.keymap.set("n", "<leader>sP", [["+P]])
--Delete to system clipboard
vim.keymap.set({"n", "v"}, "<leader>sd", [["+d]])
vim.keymap.set("n", "<leader>sD", [["+D]])

--Make current file executable
vim.keymap.set("n", "<leader>xf", "<cmd>!chmod +x %<CR>", { silent = true })

--Stop highlighted after a search
vim.keymap.set("n", "<leader>th", function() vim.cmd("noh") end)

--Run file with python
vim.keymap.set("n", "<leader>xp", function() vim.cmd("!python3.11 %") end)

local function index(seq, elem)
  for i, v in ipairs(seq) do
    if v == elem then
      return i
    end
  end

  return nil
end

local function toggle_guide()
  local wc = "120"
  local cc = vim.opt.cc:get()
  local i = index(cc, wc)

  if i then
    table.remove(cc, i)
  else
    table.insert(cc, wc)
  end

  vim.opt.cc = cc
end

vim.keymap.set("n", "<leader>tc", toggle_guide)

local function toggle_wrap()
    vim.opt.wrap = not(vim.opt.wrap:get())
end

vim.keymap.set("n", "<leader>tw", toggle_wrap)
