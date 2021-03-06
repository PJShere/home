set nocompatible              " required

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
Plugin 'mhartington/oceanic-next'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
"MultiSelect
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'mrk21/yaml-vim'
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
	colorscheme OceanicNext 
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
nnoremap <C-F> za
set fdm=indent "set foldmethod to indent
au Syntax c,cpp,vim,xml,html,xhtml,perl,python normal zR

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

au BufNewFile,BufRead *.html,*.css,*.js,*.jsx
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
autocmd BufRead,BufNewFile *.js    setf javascript
au FileType python map <buffer> <leader>f :call Flake8()<CR>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <Y> :y$

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

vnoremap // y/<C-R>"<CR>
"keep selection in Visual mode
vnoremap > >gv
vnoremap < <gv
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
