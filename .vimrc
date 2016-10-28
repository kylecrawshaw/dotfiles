"enable syntax highlighting
syntax enable


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

set encoding=utf-8 " necessary for unicode glyphs

" configure Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'davidhalter/jedi-vim'
Plugin 'danro/rename.vim'
Plugin 'klen/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'wincent/command-t'
Plugin 'airblade/vim-gitgutter'
Plugin 'moll/vim-node'
Plugin 'bling/vim-airline'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" background and colorscheme
set background=dark
colorscheme solarized

" NERDTree Shortcuts
map <C-n> :NERDTreeToggle<CR>
" Toggle NERDTree with <leader>d
" map <silent> <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
autocmd VimEnter * if !argc() | NERDTree | endif


" Python-mode options
let g:pymode_virtualenv = 1
let g:virtualenv_directory = '$PWD'
let g:virtualenv_auto_activate = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes']
let g:pymode_options_max_line_length = 120
" enable all Python syntax highlighting features
let python_highlight_all = 1

" maybe git rid of
" filetype plugin on
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'

" Ultisnips prefs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set laststatus=2 " always show the status
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set mouse=a " enable mouse in all modes
set ttymouse=xterm  " set mouse type to xterm
