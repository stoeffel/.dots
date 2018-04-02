source ~/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'arcticicestudio/nord-vim'
  Plug 'challenger-deep-theme/vim'
  Plug 'chriskempson/base16-vim'
  Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
  Plug 'lifepillar/vim-solarized8'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'morhetz/gruvbox'
  Plug 'owickstrom/vim-colors-paramount'
  Plug 'rakr/vim-one'
  Plug 'w0ng/vim-hybrid'
  Plug 'whatyouhide/vim-gotham'
call plug#end()

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  setlocal statusline=%#fzf1#\ 𝛌
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:ale_linters = { 'ruby': [], 'haskell': [ 'stack-build' ]}
let g:fzf_layout = { 'up': '40%' }
let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_sass = []
let g:neoterm_shell = 'fish'
set bg=dark
colo nord
