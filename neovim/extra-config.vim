" # Global settings
filetype plugin indent on
syntax on

:scriptencoding utf-8
let &showbreak = '↪ '
set clipboard^=unnamed,unnamedplus
" set completefunc=emoji#complete
" set completeopt+=longest
" set completeopt-=preview
set cursorline
set expandtab
set hidden
set mouse=a
set noswapfile
set number
set path=**
set shell=/bin/bash " required by gitgutter plugin
set updatetime=100  " ensures gitgutter updates every 100ms
set shiftround
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set ttyfast " removed in nvim
set undodir=~/tmp/vim/undo
set undofile
set wildignorecase

" # Plugin configuration
let g:EditorConfig_exclude_patterns = ['.git/COMMIT_EDITMSG']
let g:ale_elm_make_use_global=1
let g:ale_linters = { 'haskell': ['hlint', 'hdevtools'] }
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:deoplete#enable_at_startup = 1
let g:elm_format_autosave = 0
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:fzf_layout = { 'window': 'enew' }
let g:haskell_indent_disable=1 "Automatic indenting and hindent don't agree
let g:localvimrc_persistent=2 "See plugin: embear/vim-localvimrc
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'tab'
let g:netrw_liststyle=1
let g:test#strategy = 'neoterm'
let $FZF_DEFAULT_OPTS .= ' --no-height' " fixes fzf in nvim terminals

let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]


if !isdirectory(expand(&undodir))
   call mkdir(expand(&undodir), 'p')
endif

" # Mappings
let g:mapleader=' '
let g:maplocalleader='\'

nnoremap <C-h> :HopWord<cr>
" global search
nnoremap <C-S> :Rg <C-R><C-W><CR>
vnoremap <C-S> "yy<esc>:Rg <C-R>y<CR>

" Autocompletion fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" fzf yank
nnoremap <leader>y :FZFNeoyank<cr>
nnoremap <leader>Y :FZFNeoyank " P<cr>
vnoremap <leader>y :FZFNeoyankSelection<cr>

" Terminal mappings
nnoremap <silent> <C-T> :<c-u>exec v:count.'Ttoggle'<cr>
tnoremap <silent> <C-T> <C-\><C-n>:<c-u>exec v:count.'Ttoggle'<cr>
tnoremap <C-[> <C-\><C-n>
tnoremap <C-O> <C-\><C-n>`N


" Hightlight all incremental search results
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

" " nvim-completion-manager
" " use <TAB> to select the popup menu
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" # Autocmds
augroup customCommands
  autocmd!
  " Elm key bindings
  autocmd FileType elm nmap <buffer> <localleader>m :ElmMake<cr>
  autocmd FileType elm nmap <buffer> <localleader>M :ElmMakeMain<cr>
  autocmd FileType elm nmap <buffer> <localleader>t :ElmTest<cr>
  autocmd FileType elm nmap <buffer> <localleader>r :ElmRepl<cr>
  autocmd FileType elm nmap <buffer> <localleader>d :ElmShowDocs<cr>
  autocmd FileType elm nmap <buffer> <localleader>D :ElmBrowseDocs<cr>
  autocmd FileType elm set tabstop=4
  autocmd FileType elm set shiftwidth=4
  nmap <silent> <localleader>e <Plug>(ale_detail)
  nmap <silent> <localleader>s :TestNearest<CR>
  nmap <silent> <localleader>t :TestFile<CR>
  nmap <silent> <localleader>a :TestSuite<CR>
  nmap <silent> <localleader>l :TestLast<CR>
  nmap <silent> <localleader>g :TestVisit<CR>
  autocmd BufWritePre * Neoformat
augroup END

" # Commands
command! ReloadConfig execute "source ~/.config/nvim/init.vim"

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1,
  \   { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' },
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

set termguicolors

let $FZF_DEFAULT_COMMAND = 'rg --files | similarity-sort'

call plug#begin('~/.vim/plugged')
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons' " lua
  Plug 'ryanoasis/vim-devicons' " vimscript

  Plug 'nvim-telescope/telescope-fzf-native.nvim'
  Plug 'arithran/vim-delete-hidden-buffers'
  Plug 'arthurxavierx/vim-caser'
  Plug 'bronson/vim-visual-star-search'      "  Easily search for the selected text
  Plug 'justinhoward/fzf-neoyank'
  Plug 'vim-scripts/CursorLineCurrentWindow' "  Only show the cursorline in the active window
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()


let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <C-f> mN:Lines<cr>

let g:ale_linters = { 'ruby': [], 'haskell': [], 'elm': [] }
let g:ale_set_highlights = 0

let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_sass = []
let g:neoformat_nix_nixfmt = { 'exe': 'nixfmt', 'stdin': 1 }
let g:neoformat_enabled_nix = ['nixfmt']
let g:neoformat_enabled_agda = []
let g:neoformat_enabled_purescript = ['purty']

let g:vim_markdown_fenced_languages = ['haskell']
let g:vim_markdown_folding_disabled = 1

set showtabline=0
set bg=dark
" let ayucolor="light"
" let g:neosolarized_italic = 1
" let g:neosolarized_contrast = "high"
" let g:neosolarized_visibility = "high"
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1
let g:tokyonight_style = 'storm'
colo tokyonight

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE guifg=darkgrey
hi SignColumn guibg=NONE ctermbg=NONE
hi Comment cterm=italic gui=italic
hi VertSplit ctermbg=NONE guibg=NONE
hi StatusLine guibg=NONE ctermbg=NONE

let g:nnn#set_default_mappings = 0
" Then set your own
nnoremap <silent> <leader>nn :NnnPicker<CR>
" Or override
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <C-U> mN:Buffers<CR>
nnoremap <C-t> :!tmux split-window <cr><cr>

onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

function! s:IndTxtObj(inner)
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") =~ "^\\s*$"
    return
  endif
  let p = line(".") - 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p > 0 && (nextblank || indent(p) >= i )
    -
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    -
  endif
  normal! 0V
  call cursor(curline, 0)
  let p = line(".") + 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p <= lastline && (nextblank || indent(p) >= i )
    +
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    +
  endif
  normal! $
endfunction
" Using Lua functions
" nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <C-B> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <C-/> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>: <cmd>lua require('telescope.builtin').commands()<cr>
" nnoremap <leader>/ <cmd>lua require('telescope.builtin').search_history()<cr>
" nnoremap <leader>: <cmd>lua require('telescope.builtin').command_history()<cr>
" nnoremap <leader>? <cmd>lua require('telescope.builtin').help_tags()<cr>

lua <<EOF
require'telescope'.setup{
  defaults = {
    selection_caret = '->',
  },
}
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    style = 'storm',
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { {'mode', format=function(mode) return ' ' end} },
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'branch'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF


if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
  set undodir=~/.nvim-undo-dir
endif

