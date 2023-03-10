local custom_powerline_dark = require'lualine.themes.powerline_dark'
--Change the background of lualine_c section for normal mode
local custom_purple = '#ff45ff'
custom_powerline_dark.insert.c.bg = 'black'
custom_powerline_dark.normal.c.bg = 'black'
custom_powerline_dark.insert.a.bg = 'red'
custom_powerline_dark.insert.b.bg = '0ff800'
custom_powerline_dark.normal.a.bg = 'lawngreen'
custom_powerline_dark.visual.a.bg = custom_purple
custom_powerline_dark.visual.a.fg = 'white'
custom_powerline_dark.visual.b.bg = 'white'
custom_powerline_dark.visual.c.bg = 'black'
custom_powerline_dark.visual.b.fg = 'black'
custom_powerline_dark.insert.a.fg = 'black'


require('lualine').setup {
    options = {
        theme = custom_powerline_dark,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'', '', ''},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'branch'}

    }
}
