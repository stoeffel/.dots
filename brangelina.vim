" Five steps to get started:

" (1) Copy this file to ~/.config/nvim/init.vim

" (2) Replace this with a path to brangelina on your machine.
source ~/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  " (3) Add your custom plugins below.
  Plug 'iCyMind/NeoSolarized'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'dracula/vim'
  Plug 'whatyouhide/vim-gotham'
  Plug 'joshdick/onedark.vim'
call plug#end()

" (4) Configure the theme you want to use below.
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'right': []
      \ },
      \ }
let g:lightline.mode_map = {
		    \ 'n' : ' ',
		    \ 'i' : '✏',
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
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [] }
set background=dark
" let g:neoterm_shell = 'zsh'
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
colo NeoSolarized

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:ale_linters = { 'elm': [] }
" (5) Enjoy using branglina.vim. Issues and pull requests are welcome!
set fillchars+=vert:\ "
hi VertSplit ctermbg=NONE guibg=NONE

