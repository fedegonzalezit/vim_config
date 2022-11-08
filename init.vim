filetype on
filetype plugin on
set ts=4
set sw=4
set softtabstop=4
set shiftwidth=4
set number 
set mouse=a 
set numberwidth=2 
syntax enable 
set showcmd
set ruler
set encoding=utf-8
set showmatch
set relativenumber
set laststatus=2
set splitbelow
set splitright
set nowrap
set ignorecase
set mouse=v

call plug#begin(stdpath('config') . '/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'
Plug 'majutsushi/tagbar'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/context_filetype.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Townk/vim-autoclose'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
" Plug 'myusuf3/numbers.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ambv/black'


" visual
Plug 'ryanoasis/vim-devicons'
" Plug 'yggdroot/identline'


Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-pyright

call plug#end()

" onehalf theme config
set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"" gruvbox theme
"colorscheme gruvbox
"set bg=dark
"let g:gruvbox_contrast_dark = "soft"

let NERDTreeQuitOnOpen=1
let mapleader= " "
let g:python_highlight_all = 1

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>n :tabnew<CR>
nmap <Leader>m :tabm<CR>
nnoremap <Leader>h :vertical resize +15 <CR>
nnoremap <Leader>l :vertical resize -15<CR>

vnoremap <F2> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <F2> :split<CR>:ter<CR>:resize 15<CR>
" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.
"
" Tagbar -----------------------------

" toggle tagbar display
map <F8> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Deoplete -----------------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'ignore_case': v:true,
\   'smart_case': v:true,
\})
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'


" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" vim-go
let g:go_bin_path = $HOME."/go/bin"

" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>


if has('win32')
  " Avoid mswin.vim making Ctrl-v act as paste
  noremap <C-V> <C-V>
endif
