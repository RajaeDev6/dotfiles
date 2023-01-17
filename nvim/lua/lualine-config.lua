local custom_powerline_dark = require'lualine.themes.powerline_dark'
--Change the background of lualine_c section for normal mode
local custom_purple = '#ff45ff'
custom_powerline_dark.insert.c.bg = 'black'
custom_powerline_dark.normal.c.bg = 'black'
custom_powerline_dark.insert.a.bg = 'black'
custom_powerline_dark.insert.b.bg = '0ff800'
custom_powerline_dark.normal.a.bg = 'white'
custom_powerline_dark.visual.a.bg = custom_purple
custom_powerline_dark.visual.a.fg = 'white'
custom_powerline_dark.visual.b.bg = 'white'
custom_powerline_dark.visual.c.bg = 'black'
custom_powerline_dark.visual.b.fg = 'black'
custom_powerline_dark.insert.a.fg = '#0ff800'


require('lualine').setup {
    options = {
        theme = custom_powerline_dark
    }
}
