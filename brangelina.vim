source ~/brangelina/brangelina.vim

call plug#begin('~/.vim/plugged')
  call BrangelinaPlugins()
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'herrbischoff/cobalt2.vim'
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
  Plug 'atelierbram/Base2Tone-vim'
  Plug 'trevordmiller/nova-vim'
  Plug 'icymind/NeoSolarized'
  Plug 'ayu-theme/ayu-vim'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ayu-theme/ayu-vim-airline'
  Plug 'logico-dev/typewriter'
  Plug 'trevordmiller/nova-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'atelierbram/Base2Tone-vim'
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

" AIRLINE
let g:airline_theme='monochrome'
set bg=light
colo solarized8_flat
let g:airline#extensions#tabline#show_buffers = 0
