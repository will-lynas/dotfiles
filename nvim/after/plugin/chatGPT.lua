require("chatgpt").setup({})

vim.keymap.set("n", "<leader>ch", function() vim.cmd("ChatGPT") end, {})
