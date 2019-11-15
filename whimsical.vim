source ~/whimsical/whimsical.vim

set termguicolors
call plug#begin('~/.vim/plugged')
  call WhimsicalPlugins()
  Plug 'derekwyatt/vim-scala'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'haishanh/night-owl.vim'
  Plug 'idris-hackers/idris-vim'
  Plug 'junegunn/limelight.vim'
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
  Plug 'joshdick/onedark.vim'
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

let g:ale_set_highlights = 0
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


" let g:solarized_visibility = "high"
" let g:solarized_diffmode = "high"
" let g:solarized_termtrans = 1
" let g:solarized_statusline = "flat"
" let g:solarized_italics = 1
" let g:solarized_extra_hi_groups = 1
" let g:onedark_terminal_italics = 1
let ayucolor="dark"
colo ayu

" AIRLINE
" let g:airline_theme = 'gotham'
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ []
    \ ]
set showtabline=0
hi Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic
hi VertSplit ctermbg=NONE guibg=NONE
au FileType md let b:presenting_slide_separator = '\v(^|\n)\#{1,4}\s'
vnoremap <Leader>za <Esc>mm`<kzfgg`>jzfG`<'m
nnoremap <silent><Leader>zo <Esc>mmzRzz'm
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
