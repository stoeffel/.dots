source ~/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  Plug 'lifepillar/vim-solarized8'
  Plug 'rakr/vim-one'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'owickstrom/vim-colors-paramount'
  Plug 'whatyouhide/vim-gotham'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'challenger-deep-theme/vim'
call plug#end()

let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_sass = []
let g:ale_linters = { 'ruby': [], 'haskell': [ 'stack-build' ]}
let g:neoterm_shell = 'fish'
set bg=dark
colo nord
