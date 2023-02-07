local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
    print("treesitter not installed")
end
ts.setup{
    ensure_installed = {"lua","tsx"},
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
}

