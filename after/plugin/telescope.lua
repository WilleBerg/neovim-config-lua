local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pz', function()
    builtin.grep_string( {search = vim.fn.input("Grep > ")})
end, {desc="Grep a string"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pa', function()
	builtin.find_files({
		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" },
	})
end)
vim.keymap.set('n', '<leader>sf', function()
	builtin.find_files({
		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*"},
		cwd = "~/",
	})
end)
vim.keymap.set('n', '<leader>sz', function()
	builtin.live_grep({
		find_command = { "rg", "--files", "--hidden", "--ignore", "!**/.git/*" },
		cwd = "~/.config/nvim",
	})
end, {desc="Live greps .config/nvim"})
vim.keymap.set('n', '<leader>lg', function()
	builtin.live_grep({
		find_command = { "rg", "--files", "--hidden", "--ignore", "!**/.git/*" },
	})
end, {desc="Live greps current working directory"})
vim.keymap.set('n', '<leader>kb', function()
	builtin.keymaps()
end, {desc="Lists all keybinds"})
