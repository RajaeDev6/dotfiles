local status, packer = pcall(require, "packer")

if (not status) then
print('packer not installed')
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup( function(use)

    use 'wbthomason/packer.nvim'
    --colorschemes
    use {
        'morhetz/gruvbox', 'hachy/eva01.vim'
        }
    --icons
    use 'nvim-tree/nvim-web-devicons'
    --tree for folder     
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use 'nvim-treesitter/nvim-treesitter'
    --auto close tags
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    
    --tabs
    use 'romgrk/barbar.nvim'

    --lsp
    use { 
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    }
    --autocomplete and snippets
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
    }
    --telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'
    use 'jremmen/vim-ripgrep'
    use 'ThePrimeagen/vim-be-good'
    use 'Yggdroot/indentLine'
    use 'norcalli/nvim-colorizer.lua'
    use 'aca/emmet-ls'

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    --comment
    use 'numToStr/Comment.nvim'
    use 'mg979/vim-visual-multi'
end)


require('nvim-autopairs').setup {}
require'colorizer'.setup()
vim.cmd [[let g:react_import_jsx#auto_complete = 1]]
