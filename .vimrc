"enable syntax highlighting
syntax enable

set background=dark
" if has('gui_running')
"     set background=dark
" else
"     set background=light
" endif
colorscheme solarized

filetype indent plugin on
let g:pymode_options_max_line_length = 120
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3
" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" configure Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdTree'
Plugin 'davidhalter/jedi-vim'
Plugin 'danro/rename.vim'
Plugin 'klen/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

map <C-n> :NERDTreeToggle<CR>

" Python-mode options
let g:pymode_virtualenv = 1

let NERDTreeIgnore = ['\.pyc$']

let g:pymode_lint_checkers = ['pylint', 'pyflakes']
let NERDTreeShowHidden=1
filetype plugin on
let vim_markdown_preview_github=1
" let vim_markdown_preview_browser='Google Chrome'
