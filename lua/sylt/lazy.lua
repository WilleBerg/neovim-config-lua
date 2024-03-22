-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"catppuccin/nvim", name = "catppuccin", priority = 1000
	},
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		'nvim-treesitter/nvim-treesitter',
	},
	{
		'ThePrimeagen/harpoon',
	},
	{
		'mbbill/undotree'
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		'nvim-lualine/lualine.nvim'
	},
	{
		'tpope/vim-fugitive'
	},
    {
        'lewis6991/gitsigns.nvim'
    },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.api.nvim_command, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
		},
	},
    {
        'numToStr/Comment.nvim'
    },
    {'tpope/vim-repeat'},
    {'ggandor/leap.nvim'},
    {'m4xshen/autoclose.nvim'},
    -- {
    --     "zbirenbaum/copilot.lua", lazy = true,
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- },
    {
        "nvim-treesitter/nvim-treesitter-context"
    },
    {
            'RubixDev/ebnf',
            rtp = 'crates/tree-sitter-ebnf',
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
}
}

require("lazy").setup(plugins)
