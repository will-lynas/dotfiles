local M = {}

M.home = os.getenv("HOME")

-- Directory for local plugin development
M.dev = M.home .. "/dev"

return M
