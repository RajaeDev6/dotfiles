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
        'morhetz/gruvbox', 'hachy/eva01.vim',
        'ray-x/aurora', 'sjl/badwolf'
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
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    
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
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',


        --luasnip
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

       'rafamadriz/friendly-snippets',
        --ultisnip
        --'quangnguyen30192/cmp-nvim-ultisnips',
        --'SirVer/ultisnips',


        --snippy
        --'dcampos/nvim-snippy',
        --'dcampos/cmp-snippy',
    }
    --telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    --use 'nvim-lua/telescope.nvim'
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use 'jremmen/vim-ripgrep'

    --indentline
    use 'Yggdroot/indentLine'

    --colorizer
    use 'norcalli/nvim-colorizer.lua'

    --emmet
    use 'aca/emmet-ls'

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    --comment
    use 'numToStr/Comment.nvim'
    use 'mg979/vim-visual-multi'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'tpope/vim-fugitive'
end)

require("colorizer").setup {}
require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}
