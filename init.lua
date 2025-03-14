-- Get the path to the directory containing your init.lua file
local config_dir = vim.fn.stdpath('config')

-- Add the config directory to the package path
package.path = package.path .. ';' .. config_dir .. '/?.lua'


vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
          cargo = {
            features = {
                "all_queues"
            }
          }
      },
    },
  },
}
require("sylt")
require('leap').add_default_mappings()
