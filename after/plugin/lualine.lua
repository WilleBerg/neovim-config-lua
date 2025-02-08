local colorscheme = require('after/plugin/color').lualine_colorscheme

local function get_client()
	local clients = vim.lsp.get_active_clients()
	if next(clients) ~= nil then
		return clients[1].name
	end
	return ''
end

local function get_mode_with_icon()
  local mode = vim.fn.mode():lower()
  local mode_names = {
    n = 'Normal',
    i = 'Insert',
    v = 'Visual',
    V = 'V-Line',
    [''] = 'V-Block',
    c = 'Command',
    t = 'Terminal',
  }
  local full_mode_name = mode_names[mode] or mode
  return ' ' .. full_mode_name:upper()
end

require('lualine').setup {
	options = {
		-- theme = 'catppuccin',
        -- theme = 'gruvbox_dark',
        theme = colorscheme,
		icons_enabled = true,
		component_separators = { '|' },
		section_separators = { left = '', right = ''},
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
		lualine_a = {get_mode_with_icon},
		lualine_b = {'filename'},
		lualine_c = {'branch', {'diff', symbols = { added = ' ', removed = ' ', modified = ' '}}},
		lualine_x = {'diagnostics', get_client, 'fileformat', 'filetype'},
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
