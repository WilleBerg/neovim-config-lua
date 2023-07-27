-- Load the luatz library to handle time and timezone
local tz = require("luatz")

-- Function to get the current time in HH:MM format in your local timezone
local function get_time()
  local now = tz.time()

  -- Replace "Your/Desired/Timezone" with the appropriate timezone string, e.g., "America/New_York"
  local local_time = tz.localtime(now, "Sweden/Stockholm")

  -- Format the datetime object into HH:MM format
  local formatted_time = local_time:strftime("%H:%M")

  return formatted_time
end

require('lualine').setup {
	options = {
		theme = 'catppuccin-mocha',
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		--lualine_z = {'location', get_time }
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
