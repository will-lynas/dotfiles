local M = {}

M.home = os.getenv("HOME")
M.dev = M.home .. "/dev"
M.obsidian = {
	vault = M.home .. "/Documents/Obsidian Vault",
	daily = "Daily",
}

return M
