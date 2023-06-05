set number
set relativenumber
set showmode
set termguicolors
set smarttab
set wrap
set ruler
set cursorline
set smartindent
set shiftwidth=4
set tabstop=4
set hlsearch
set incsearch
set completeopt+=menuone,menu,noinsert
set wildmenu
let mapleader = ' '
set t_u7=
set ambw=double
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


inoremap jj <esc>
nnoremap <leader>sf :source %<CR>
noremap <leader>q :q!<CR>
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <tab> :bNext<CR>
nnoremap <s-tab> :bprevious<CR>
nnoremap <c-s> :w!<CR>
nnoremap <leader>hs :History<CR>
nnoremap <leader>t :vert rightbelow terminal<CR>
nnoremap <leader>h : below terminal<CR>
nnoremap <leader>k :nohlsearch<CR>
tnoremap <leader>q <C-\><C-n><C-w>c
nnoremap <leader><leader>p :Prettier<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>ac  <Plug>(coc-codeaction)
nnoremap <leader>sr :%s/
nnoremap <s-h> <cmd>LspHover<CR>
nnoremap <leader>; <cmd>LspDocumentDiagnostics<CR>
nnoremap <s-f> <cmd>LspDocumentFormat<CR>
nnoremap jd <cmd>LspPeekDefinition<CR>

set scrolloff=4
syntax on
set belloff=all
let &t_EI = "\e[2 q"

call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/vim-lsp-settings'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'jdsimcoe/hyper.vim'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

"colorscheme hyper
colorscheme catppuccin_mocha
"colorscheme gruvbox
set background=dark
"hi Normal guibg=NONE cterm=NONE
highlight Cursorline cterm=underline gui=underline ctermbg=NONE guibg=NONE
highlight Cursor guifg=black guibg=purple ctermbg=green
highlight Normal guibg=NONE ctermbg=NONE

"Configure coc.nvim
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pyright',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ ]

" configure coc-snippets

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()
inoremap <expr><s-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"let g:airline_theme = 'catppuccin_mocha'
let g:airline_theme = 'hyper'
"let g:airline_section_z = airline#section#create(['%{strftime("%H:%M %p")} ',''])

let g:airline_section_a = '%{toupper(mode())}'
let g:airline_section_b = ''
let g:airline_section_c = '%{expand("%:p:h:t")}/%{expand("%:t")}'
let g:airline_section_x = '%{hostname()}'
let g:airline_section_y = ""
let g:airline_section_z = '%{strftime("%I:%M %p")}'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


function! RuncFile()
  let file = expand('%:p')
  if file =~ "\.c$"
      execute "!gcc " . file . " && ./a.out"
  elseif file =~ "\.py$"
      execute "!python3 " . file
  elseif file =~ "\.js$"
      execute "!node " . file
  elseif file =~ "\.ts$"
      execute "!ts-node " . file
  elseif file =~ "\.go$"
      execute "!go run " . file
  endif
endfunction


autocmd FileType c,javascript,python,typescript,go nnoremap <leader>jf :call RuncFile()<CR>


" used to highlight word on yank
augroup highlightYankedText
    autocmd!
    autocmd TextYankPost * call FlashYankedText()
augroup END


function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif
    let matchId = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()
    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(350, 'DeleteTemporaryMatch')
endfunction

function! DeleteTemporaryMatch(timerId)
    while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]
        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction


