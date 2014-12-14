set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/syntastic.git'
Plugin 'godlygeek/tabular.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'henrik/vim-indexed-search.git'
Plugin 'Lokaltog/vim-powerline.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'tpope/vim-rails.git'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'honza/vim-snippets.git'
Plugin 'tristen/vim-sparkup.git'

" Color schemes
Plugin 'altercation/vim-colors-solarized.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin indent on

"solarized
syntax enable
let g:solarized_termtrans = 1 
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
autocmd FileType pp setlocal shiftwidth=2 tabstop=2
autocmd FileType rb setlocal shiftwidth=2 tabstop=2
autocmd FileType erb setlocal shiftwidth=2 tabstop=2
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
