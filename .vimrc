execute pathogen#infect()
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
