local color = {}
color.lualine_colorscheme = "gruvbox_dark"
-- color.lualine_colorscheme = "catppuccin"
--
color.colorscheme = "gruvbox"
-- color.colorscheme = "catppuccin"

vim.cmd("colorscheme " .. color.colorscheme)

function ColorMyPencils(colour)
     colour = colour or color.colorscheme
     vim.cmd.colorscheme(colour)

     vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
 end

 ColorMyPencils()

return color
