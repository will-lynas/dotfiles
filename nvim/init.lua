local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- TODO: fix this disable for fs_stat
---@diagnostic disable-next-line
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("autocmds")
require("keymaps")

-- TODO: split out lazy into file
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	dev = {
		path = require("paths").dev,
		patterns = { "grapple-line.nvim", "grapple-utils.nvim" },
		fallback = true,
	},
})
