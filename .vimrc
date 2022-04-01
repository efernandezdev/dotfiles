set tabstop=4
set shiftwidth=4
set re=0

set wrap
set number
set mouse=a
set t_Co=256
set expandtab
set noswapfile
set nocompatible
set encoding=utf-8
set relativenumber
set background=dark
set clipboard=unnamed
set foldmethod=manual
set backspace=indent,eol,start

let mapleader = " "
let g:indentLine_char = "|"
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_showFirstIndentLevel = 1
"-----------------------------
"Config Coc-Explorer
" 1) Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_matchit = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
" 2) Auto start
" augroup coc-explorer
"   if @% == '' || @% == '.'
"     autocmd User CocNvimInit bd
"     autocmd User CocNvimInit CocCommand explorer --width 60 --position right 
" endif
" augroup END
"End Confi Coc-Explorer
"-------------------------------------------------------------------
filetype off
syntax enable
filetype plugin on
filetype plugin indent on
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
"-------------------------------------------------------------------
" CoC Settings
set hidden
set nobackup
set shortmess+=c
set nowritebackup
set updatetime=300
highlight FgCocErrorFloatBgCocFloating ctermfg=15 ctermbg=9 
" End CoC Settings
"-------------------------------------------------------------------
" Search Settings
set hlsearch!
set incsearch
set showmatch
set smartcase
set ignorecase
" End Search Settings
"-------------------------------------------------------------------
" FzF
nnoremap <silent><space>b :Buffers<CR>
nnoremap <silent><space>f :Files<CR>
nnoremap <silent><space>ag :Ag<CR>
nnoremap <silent><space>rg :Rg<CR>
"Escape edit Mode
inoremap <silent>ii <Esc> 
" Commentary KeyMaps
nnoremap <silent><space>/ :Commentary<CR>
vnoremap <silent><space>/ :Commentary<CR>
" FormatFile KeyMaps
nmap <expr> <C-f> &filetype == 'python' ? '<Plug>(coc-format)<cr><bar> :IndentLinesReset 0<cr>':':IndentLinesReset 2 <cr> <bar> :Prettier<cr>'
"Tabs Options
nnoremap <silent><C-p> :below term <CR>
nnoremap <silent><leader><Right> :tabnext <CR>
nnoremap <silent><leader><Left> :tabprevious <CR>
"Buffer Options
nnoremap <silent><leader>q :bd <CR>
nnoremap <silent><C-Left> :bp <CR>
nnoremap <silent><C-Right> :bn <CR>
"Toggle Number
nnoremap <silent><C-Down> :set rnu! <Bar> :set nu!<CR>
"Setting
nnoremap <silent><C-q> :q <CR>
nnoremap <silent><C-s> :w <CR>
"Hide Match /
nnoremap <silent><CR> :noh <Bar> :let @/ = "" <CR>
"Coc Explorer
nnoremap <silent><C-Up> :CocCommand explorer --width 60 --position right<CR>
"Folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
"-------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

let g:coc_global_extensions = ['coc-snippets',
                        \ 'coc-prettier',
                        \ 'coc-pairs',
                        \ 'coc-explorer',
                        \ 'coc-tsserver',
                        \ 'coc-python',
                        \ 'coc-emmet',
                        \ 'coc-json',
                        \ 'coc-css',
                        \ 'coc-angular',
                        \ 'coc-eslint']
call plug#end()
"-------------------------------------------------------------------
" CoC Prettier Settings
let g:prettier#config#tab_width=4
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" End Prettier Settings
" Coc Json Settings
autocmd Filetype json
        \ setlocal conceallevel = 0 |
        " \ let g:indentLine_setConceal = 0 |
        " \ let g:vim_json_syntax_conceal = 0
" End Coc Json Settings
"-------------------------------------------------------------------
" Key Maps Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" End Key Maps Coc
"-------------------------------------------------------------------
" AirLines Config
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'short_path'

" enable powerline fonts
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'
let g:airline_powerline_fonts = 1

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode
" End AirLines Config
"-------------------------------------------------------------------
