"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdTree'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'


call plug#end()

syntax enable

set hidden
set relativenumber
set inccommand=split
set notermguicolors
set autowrite			    " Salvação divina
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set hlsearch			    " Grifa as buscas


"colorscheme delek
colorscheme ir_black_alex2

let mapleader=","

nnoremap <leader>ev :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <C-s> :w! <CR>
nnoremap <C-q> :q! <CR>

"buffer navigations
nnoremap <C-Left> :bn<CR>
nnoremap <C-Right> :bp<CR>

"window navigations
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-g> <C-w>h
nnoremap <TAB> <C-w>w

" Acesso mais veloz ao command mode
nmap ç :
vmap ç :
nmap Ç :!
" Faz com que o zero retorne ao início da linha seguindo a edentação
nmap 0 ^

nmap < gg
nmap > G

nmap <F2> :NERDTreeToggle<CR>
nmap <F12> :PlugInstall <CR>

map <leader>h :noh<CR>

" Python PEP8 Identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_theme='minimalist'
let g:SuperTabDefaultCompletionType = "<C-n>" "SuperTab plugin

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid 
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help 
" pages for vim-airline :help airline-troubleshooting
