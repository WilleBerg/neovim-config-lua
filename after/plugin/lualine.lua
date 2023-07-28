
function get_client()
	local clients = vim.lsp.get_active_clients()
	if next(clients) ~= nil then
		return clients[1].name
	end
	return ''
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
		lualine_x = { get_client, 'fileformat', 'filetype'},
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
