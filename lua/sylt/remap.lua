vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({"n", "v"}, "<leader>P", "\"+p") -- paste from clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y") -- yank to clipboard
-- Newline but stay in normal mode
vim.keymap.set({"n", "v"}, "<leader>o", "o<Esc>")
vim.keymap.set({"n", "v"}, "<leader>O", "O<Esc>")

vim.api.nvim_set_keymap('v', '<leader>wp', [[<Esc>`>a)<Esc>`<i(<Esc>v`>ll]], { noremap = true }) --wrap paranthesis
vim.api.nvim_set_keymap('v', '<leader>wQ', [[<Esc>`>a"<Esc>`<i"<Esc>v`>ll]], { noremap = true }) --wrap qutoes
vim.api.nvim_set_keymap('v', '<leader>wq', [[<Esc>`>a'<Esc>`<i'<Esc>v`>ll]], { noremap = true }) --wrap qutoes
vim.api.nvim_set_keymap('v', '<leader>wb', [[<Esc>`>a}<Esc>`<i{<Esc>v`>ll]], { noremap = true }) --wrap brackets

vim.keymap.set('n', '<Esc>', function()
    vim.cmd('nohlsearch')
    vim.api.nvim_exec_autocmds('User', { pattern = "EscPressedInNormal" })
end, { desc='Clear search highlight on Escape'})

vim.api.nvim_set_keymap('n', '<leader>h', '<Cmd>lua RemoveSearchHighlight()<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>","<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>","<cmd> TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>","<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>","<cmd> TmuxNavigateUp<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --move line/s up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --move line/s down

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without copy

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete without copy

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
