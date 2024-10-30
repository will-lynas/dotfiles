vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		if vim.fn.win_gettype() ~= "tab" then
			vim.cmd("wincmd T")
		end
	end,
})

vim.api.nvim_create_augroup("CheckTimeAutoCmds", { clear = true })

vim.api.nvim_create_autocmd(
	{ "CursorHold", "BufEnter", "BufWinEnter", "WinEnter", "FocusGained", "FileChangedShellPost" },
	{
		group = "CheckTimeAutoCmds",
		pattern = "*",
		command = "checktime",
	}
)
