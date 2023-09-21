-- Get the path to the directory containing your init.lua file
local config_dir = vim.fn.stdpath('config')

-- Add the config directory to the package path
package.path = package.path .. ';' .. config_dir .. '/?.lua'

require("sylt")
require('leap').add_default_mappings()

