require("sylt.remap")
require("sylt.lazy")
require("sylt.set")

-- BNF SETUP
vim.filetype.add { extension = { ebnf = 'ebnf' } }
vim.filetype.add { extension = { cf = 'cf' } }
vim.api.nvim_set_hl(0, '@string.special.grammar', { link = '@string.regex' })
vim.api.nvim_set_hl(0, '@symbol.grammar.pascal', { link = '@type' })
vim.api.nvim_set_hl(0, '@symbol.grammar.camel', { link = '@property' })
vim.api.nvim_set_hl(0, '@symbol.grammar.upper', { link = '@constant' })
vim.api.nvim_set_hl(0, '@symbol.grammar.lower', { link = '@parameter' })
