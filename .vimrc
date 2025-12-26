set backspace=indent,eol,start
set number
set relativenumber

" backup
set nobackup
set nowritebackup

" show Mode ad the bottom
set showmode

set undofile
set undodir=~/.vim/undo

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

" Searching
set hlsearch
set incsearch
set ignorecase 

" Folding
set nofoldenable
set foldlevelstart=99
set foldmethod=indent

" completion
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
" colorscheme rosepine
" colorscheme catppuccin_frappe
" colorscheme dzo
" let g:airline_theme = 'catppuccin_mocha'
colorscheme eyun 

"highlightk
highlight Cursorline cterm=underline gui=underline ctermbg=NONE guibg=NONE
highlight Cursor guifg=black guibg=purple ctermbg=Magenta
highlight Normal guibg=NONE ctermbg=NONE
highlight ModeMsg ctermbg=NONE ctermfg=50
highlight EndOfBuffer ctermbg=NONE guibg=NONE


let g:fzf_layout = { "window": { "width": 0.8, "height": 30, "relative": v:true, "yoffset": 0.6 } }
let g:fzf_colors = { "fg": ["fg", "Normal"], "bg": ["bg", "Normal"],"border": ["fg", "Keyword"] }

" PLUGINS

call plug#begin('~/.vim/plugged')
    " Gruvbox theme
    "Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" dummy text
	" Plug 'flazz/vim-colorschemes'
	Plug 'RajaeDev6/DummyWords'

    "rose-pine theme
	" Plug 'rose-pine/vim'

    "catppuccin theme
    " Plug 'catppuccin/vim', { 'as': 'catppuccin' }

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

	" editorconfig plugin
	" Plug 'editorconfig/editorconfig-vim'
    call plug#end()

"plugin settings

"yank and highlight
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 200


"KEYMAPS

let mapleader = ' '
" source vimrc
nnoremap <silent><leader>sf :source ~/.vimrc<CR>

" exit vim
noremap <leader>q :qa!<CR>
noremap <leader>z :q!<CR>

" open explorer
nnoremap <leader>e :Lexplore<CR>

"open files in current/sub-dir
nnoremap <silent> <leader>ff :Files<CR>

"show open buffers
"
nnoremap <silent> <leader>fb :Buffers<CR>

"rip grep
nnoremap <silent> <leader>g :Rg<CR>

"switch between buffer
nnoremap <silent> <tab> :bNext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>

" save file
nnoremap <c-s> :w!<CR>

"show history of files open
nnoremap <silent><leader>hs :History<CR>

""terminal
nnoremap <silent><leader>t :vert rightbelow terminal<CR>
nnoremap <silent><leader>h : below terminal<CR>
tnoremap <silent><leader>x <C-w>N:close!<CR>
" search and replace
nnoremap <leader>sr :%s/

nnoremap <silent> <leader>k :nohlsearch<CR>
nnoremap <leader><leader>p :Prettier<cr>

"jump to definition
nnoremap jd <cmd>LspPeekDefinition<CR>
nnoremap <c-a> ggVG



vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

nnoremap <silent> K :m -2<CR>==
nnoremap <silent> J :m +1<CR>==

" Coc 

"coc - keymap
inoremap <silent><expr> <c-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><c-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>sd :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

