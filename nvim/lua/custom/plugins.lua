return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		'rose-pine/neovim',
		name = 'rose-pine'
	},
	{
		'nvim-treesitter/nvim-treesitter'
	},
    {
	    'nvim-treesitter/playground'
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
	{
		'mbbill/undotree'
	},
	{
		'tpope/vim-fugitive'
	},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {
        'alexghergh/nvim-tmux-navigation'
    },
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'airblade/vim-gitgutter'
    },
    {
        'declancm/maximize.nvim'
    },
    {
        'lervag/vimtex',
        lazy = false
    },
    {
        'tpope/vim-eunuch'
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            -- add any options here
        },
    },
    {
        'zbirenbaum/copilot.lua'
    },
    {
        "Pocco81/auto-save.nvim"
    }
}
