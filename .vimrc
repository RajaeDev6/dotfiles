set backspace=indent,eol,start
set number
set relativenumber

" backup
set nobackup
set nowritebackup

" show Mode ad the bottom
set showmode

"clipboard
set clipboard=unnamedplus

set termguicolors
" Tabs and indent
set smarttab
set shiftwidth=4
set smartindent
set tabstop=4

" wrap words
set wrap
set linebreak
set ruler
" Menu at the bottom
set wildmenu

set hlsearch
set incsearch
set completeopt+=menuone,menu,noinsert

set cursorline
set t_u7=
set ambw=double
set mouse=a

set scrolloff=4
set belloff=all

let &t_EI = "\e[2 q"
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax on


" set colorsheme
set background=dark
"colorscheme gruvbox
colorscheme rosepine
" let g:airline_theme = 'catppuccin_mocha'

"highlightk
highlight Cursorline cterm=underline gui=underline ctermbg=NONE guibg=NONE
highlight Cursor guifg=black guibg=purple ctermbg=green
highlight Normal guibg=NONE ctermbg=NONE


" Plugins

call plug#begin('~/.vim/plugged')
    " Gruvbox theme
    "Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" dummy text
	Plug 'RajaeDev6/DummyWords'

    "rose-pine theme
	Plug 'rose-pine/vim'

    "catppuccin theme
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }

    "go lsp
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    "airline theme
    " Plug 'vim-airline/vim-airline'
    
    " comments
    Plug 'tpope/vim-commentary'

    " yank and highlight
    Plug 'machakann/vim-highlightedyank'
    call plug#end()

"plugin settings

"yank and highlight
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 200

" keymaps


let mapleader = ' '
" source vimrc
nnoremap <silent><leader>sf :source ~/.vimrc<CR>

" exit vim
noremap <leader>q :q!<CR>

" open explorer
nnoremap <leader>e :Lexplore<CR>

"open files in current/sub-dir
nnoremap <leader>ff :Files<CR>

"show open buffers
"
nnoremap <leader>fb :Buffers<CR>

"rip grep
nnoremap <leader>g :Rg<CR>

"switch between buffer
nnoremap <tab> :bNext<CR>
nnoremap <silent><s-tab> :bprevious<CR>

" save file
nnoremap <c-s> :w!<CR>

"show history of files open
nnoremap <silent><leader>hs :History<CR>

"terminal
nnoremap <leader>t :vert rightbelow terminal<CR>
nnoremap <leader>h : below terminal<CR>
tnoremap <leader>q <C-\><C-n><C-w>c

" search and replace
nnoremap <leader>sr :%s/

nnoremap <leader>k :nohlsearch<CR>
nnoremap <leader><leader>p :Prettier<cr>

"jump to definition
nnoremap jd <cmd>LspPeekDefinition<CR>
nnoremap <c-a> ggVG
