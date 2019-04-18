set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" JS Beautify
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
"MultiSelect
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " enables filetype detection

set splitbelow
set splitright

if has('gui_running')
  syntax enable
  set background=dark
  colorscheme solarized 
else
  colorscheme zenburn
endif

"insert mode escape remap
inoremap jk <Esc>

"visual mode escape remap
vnoremap jk <Esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldlevel=99
"set foldmethod=indent
"Enable folding with the Ctrl-F 
nnoremap <C-F> za

" Custom mappings
let mapleader = " "
nnoremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>e :echo@%<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>t :tabn<cr>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set fo-=t |
    \ set wm=0 |
    \ set wrap

au BufNewFile,BufRead *.html,*.css,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" au BufWrite *.py call Flake8() "call flake8 for pep check while writing to a .py file
autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <Y> :y$

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let python_highlight_all=1
call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu
set clipboard=unnamed

" make backspaces more powerfull
set backspace=indent,eol,start

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

syntax on

set laststatus=2 "always display status line 
set fdm=indent "set foldmethod to indent
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,python normal zR

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.vim/bundle/ultisnips"]

"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"

let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

"set directory for swap files
set directory^=$HOME/.vim/swap//
"changing working directory to current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" FoldMethod
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
" Search Selection
vnoremap // y/<C-R>"<CR>
"jsx emmet plugin for easier jsx
let g:user_emmet_settings = {
	\ 'javascript.jsx' : {
	\ 	'extends' : 'jsx',
	\ },
	\}
"keep selection in Visual mode
vnoremap > >gv
vnoremap < <gv
