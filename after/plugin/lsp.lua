local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr, remap = false}

-- Go to definition
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc = "Go to definition", unpack(opts)})
-- Show hover information
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {desc = "Show hover information", unpack(opts)})
-- Search workspace symbols
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc = "Search workspace symbols", unpack(opts)})
-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc = "Go to next diagnostic", unpack(opts)})
-- Go to previous diagnostic (commented out)
-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc = "Go to previous diagnostic", unpack(opts)})
-- Open code actions
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {desc = "Open code actions", unpack(opts)})
-- Find references
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {desc = "Find references", unpack(opts)})
-- Rename symbol
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc = "Rename symbol", unpack(opts)})
-- Show signature help (in insert mode)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc = "Show signature help", unpack(opts)})
end)

lsp.ensure_installed({
	'rust_analyzer',
    'lua_ls'
})


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        features = "all"
      }
    }
  }
})
lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Ctrl+Space to trigger completion menu
        ['<C-A-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})
