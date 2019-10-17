source ~/whimsical/whimsical.vim

set termguicolors
call plug#begin('~/.vim/plugged')
  call WhimsicalPlugins()
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'voldikss/vim-floaterm'
  Plug 'connorholyday/vim-snazzy'
  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'herrbischoff/cobalt2.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
  Plug 'lifepillar/vim-solarized8'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'morhetz/gruvbox'
  Plug 'owickstrom/vim-colors-paramount'
  Plug 'rakr/vim-one'
  Plug 'w0ng/vim-hybrid'
  Plug 'whatyouhide/vim-gotham'
  Plug 'trevordmiller/nova-vim'
  Plug 'icymind/NeoSolarized'
  Plug 'ayu-theme/ayu-vim'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ayu-theme/ayu-vim-airline'
  Plug 'logico-dev/typewriter'
  Plug 'trevordmiller/nova-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'atelierbram/Base2Tone-vim'
  Plug 'marcelbeumer/spacedust.vim'
  Plug 'vmchale/dhall-vim'
  Plug 'andreypopp/vim-colors-plain'
  Plug 'DankNeon/vim'
  Plug 'abnt713/vim-hashpunk'
  Plug 'tpope/vim-flagship'
  Plug 'DankNeon/vim'
  Plug 'KKPMW/distilled-vim'
  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'noahfrederick/vim-noctu'
  Plug 'sotte/presenting.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  setlocal statusline=%#fzf1#\ 𝛌
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': [   'Sessions']       },
      \ { 'type': 'files',     'header': [   'MRU']            },
      \ { 'type': 'commands',  'header': [   'Commands']       },
      \ ]
let g:ale_linters = { 'ruby': [], 'haskell': [], 'elm': [] }

let g:fzf_layout = { 'window': '-tabnew' }
let $FZF_DEFAULT_COMMAND = 'rg --files'

let g:notes_directories = '~/notes'

let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_sass = []
let g:neoterm_shell = 'fish'

let g:vim_markdown_fenced_languages = ['haskell']
let g:vim_markdown_folding_disabled = 1

set bg=dark
" let g:neosolarized_contrast = "high"
" let g:neosolarized_visibility = "high"
" let g:neosolarized_vertSplitBgTrans = 1
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 1
colo challenger_deep

" AIRLINE
let g:airline_theme='challenger_deep'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ []
    \ ]
set showtabline=0
hi Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
au FileType md let b:presenting_slide_separator = '\v(^|\n)\#{1,4}\s'
