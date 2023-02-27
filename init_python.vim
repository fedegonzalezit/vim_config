filetype on
filetype plugin on
" si usas tab pone espacios:
" set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set number
set mouse=a
set numberwidth=2
syntax enable
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set splitbelow
set splitright
set nowrap
set sw=4
set ts=4
set sts=4
" set ignorecase
"
" DJANGO Configuration https://code.djangoproject.com/wiki/UsingVimWithDjango 


call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ycm-core/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tweekmonster/django-plus.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
" Plug 'neomake/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'
Plug 'ambv/black'

call plug#end()

"" gruvbox theme
" colorscheme gruvbox
" set bg=dark
" let g:gruvbox_contrast_dark = "soft"

let g:airline_powerline_fonts = 1

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set ttimeoutlen=50
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif




let b:ale_linters = ['flake8']
let g:ale_completion_enabled = 0
let g:ale_virtualtext_cursor = 'never'
let g:ale_python_flake8_options = '--ignore=E203,E266,E501,W503 --max-complexity=18'
let g:ale_python_pylint_options = '--disable=C0116,C0115'
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)
nnoremap <C-,> :ALEPopulateLocList<CR>
" Neomake ------------------------------

" Run linter on write
"autocmd! BufWritePost * Neomake

"let g:neomake_python_enabled_makers = ['flake8']

" let g:neomake_python_flake8_maker = {
"   \ 'exe': '~/.venvs/base/bin/flake8'
"   \ }
" 
" let g:neomake_python_pylint_maker = {
"   \ 'args': [
"   \ '-d', 'C0103, C0111',
"   \ '-f', 'text',
"   \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
"   \ '-r', 'n'
"   \ ],
"   \ 'exe': '~/.venvs/base/bin/pylint',
"   \ 'errorformat':
"   \ '%A%f:%l:%c:%t: %m,' .
"   \ '%A%f:%l: %m,' .
"   \ '%A%f:(%l): %m,' .
"   \ '%-Z%p^%.%#,' .
"   \ '%-G%.%#',
"   \ }

" you completeme config
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_add_preview_to_completeopt = 1 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_goto_buffer_command = 'new-tab'

nnoremap <C-g>   :YcmCompleter GoToDeclaration<CR>
nnoremap <C-t> :YcmCompleter GoToDefinition<CR>
nnoremap <C-f> :YcmCompleter GetDoc<CR>

" ultisnips config
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file



let NERDTreeQuitOnOpen=0
let mapleader= " "
let g:python_highlight_all = 1

"mapeos
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>n :tabnew<CR>
nmap <Leader>m :tabm<CR>
nnoremap <Leader>h :vertical resize +15 <CR>
nnoremap <Leader>l :vertical resize -15<CR>

vnoremap <F2> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <F2> :split<CR>:ter<CR>:resize 15<CR>

nnoremap <C-b> :bprevious<CR>

