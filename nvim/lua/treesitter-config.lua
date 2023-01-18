require('nvim-treesitter.configs').setup({
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_highlighting = true,
    },
    indent = {enable = true,},
    rainbow = {
      enable = true,
    },
    autotag = {
        enabale = true,
    }
})
