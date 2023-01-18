require('nvim-treesitter.configs').setup({
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_highlighting = true,
    },
    indent = {enable = true,},
    rainbow = {
      enable = true,
    }
})
