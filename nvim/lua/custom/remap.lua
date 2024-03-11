vim.keymap.set("n", "<leader>vp", vim.cmd.Ex)

--Select text that was last pasted
vim.keymap.set("n", "gp", "`[v`]")

--Move around lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Stop J moving cursor
vim.keymap.set("n", "J", "mzJ`z")

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
vim.keymap.set("n", "<Esc>", function() vim.cmd("noh") end)

--Run file with python
vim.keymap.set("n", "<leader>xp", function() vim.cmd("!python3.11 %") end)

-- Tab controls
vim.keymap.set("n", "<leader>n", function() vim.cmd("tabnew") end)
vim.keymap.set("n", "<M-1>", function() vim.cmd("silent! tabn 1") end)
vim.keymap.set("n", "<M-2>", function() vim.cmd("silent! tabn 2") end)
vim.keymap.set("n", "<M-3>", function() vim.cmd("silent! tabn 3") end)
vim.keymap.set("n", "<M-4>", function() vim.cmd("silent! tabn 4") end)

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
