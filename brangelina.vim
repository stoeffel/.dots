" Five steps to get started:

" (1) Copy this file to ~/.config/nvim/init.vim
"

" (2) Replace this with a path to brangelina on your machine.
source ~/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  " (3) Add your custom plugins below.
  Plug 'lifepillar/vim-solarized8'
  Plug 'whatyouhide/vim-gotham'
call plug#end()

" (4) Configure the theme you want to use below.
let g:lightline = {
      \ 'colorscheme': 'gotham',
      \ 'active': {
      \   'right': [ [ 'gitbranch' ], [ 'readonly', 'modified', 'paste' ] ],
      \   'left': [ [ 'filename'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename'
      \ }
      \ }
let g:lightline.mode_map = {
		    \ 'n' : ' ',
		    \ 'i' : ' ',
        \ 'R' : ' ',
		    \ 'v' : ' ',
		    \ 'V' : ' ',
		    \ "\<C-v>": ' ',
		    \ 'c' : ' ',
		    \ 's' : ' ',
		    \ 'S' : ' ',
		    \ "\<C-s>": ' ',
		    \ 't': ' ',
		    \ }
let g:lightline.inactive = {
    \   'right': [ [ 'readonly', 'modified', 'paste' ] ],
    \   'left': [ [ 'filename'] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [] }
function! LightlineFilename()
  return expand('%:t') ==# '' ? '[No Name]' : expand('%:p:h:t') . '/' . expand('%:t')
endfunction
set background=dark
colo gotham
let $FZF_DEFAULT_COMMAND = 'rg --files'
" (5) Enjoy using branglina.vim. Issues and pull requests are welcome!
set fillchars+=vert:\ "
hi VertSplit ctermbg=NONE guibg=NONE
let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
