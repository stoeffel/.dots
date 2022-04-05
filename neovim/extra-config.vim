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
set shell=zsh
set updatetime=100  " ensures gitgutter updates every 100ms
set shiftround
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
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

" Autocompletion fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Hightlight all incremental search results
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

augroup customCommands
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
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

  Plug 'kyazdani42/nvim-web-devicons' " lua
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'wlangstroth/vim-racket'
  Plug 'folke/which-key.nvim'
  Plug 'APZelos/blamer.nvim'
  Plug 'github/copilot.vim'
  Plug 'kristijanhusak/orgmode.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons' " vimscript

  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'arithran/vim-delete-hidden-buffers'
  Plug 'arthurxavierx/vim-caser'
  Plug 'bronson/vim-visual-star-search'      "  Easily search for the selected text
  Plug 'justinhoward/fzf-neoyank'
  Plug 'vim-scripts/CursorLineCurrentWindow' "  Only show the cursorline in the active window
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' } " Vim-Plug
  Plug 'numToStr/Comment.nvim'
  Plug 'sindrets/diffview.nvim'
call plug#end()

let g:blamer_enabled = 1
set completeopt=menu,menuone,noselect
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:ale_linters = { 'ruby': [], 'haskell': [], 'elm': [] }
let g:ale_set_highlights = 0

let g:neoformat_enabled_json = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_sass = []
let g:neoformat_nix_nixfmt = { 'exe': 'nixfmt', 'stdin': 1 }
let g:neoformat_scheme_raco = { 'exe': 'raco', 'args': ['fmt', '-i'], 'stdin': 1 }
let g:neoformat_enabled_scheme = ['raco']
let g:neoformat_enabled_nix = ['nixfmt']
let g:neoformat_enabled_agda = []
let g:neoformat_enabled_purescript = ['purty']

let g:vim_markdown_fenced_languages = ['haskell']
let g:vim_markdown_folding_disabled = 1

set showtabline=0

hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi Comment cterm=italic gui=italic
hi VertSplit ctermbg=NONE guibg=NONE
hi StatusLine guibg=NONE ctermbg=NONE

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

lua <<EOF

require('nightfox').setup({
  options = {
    dim_inactive = true,   -- Non focused panes set to alternative background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold"
    }
  }
})
vim.cmd("colorscheme dawnfox")

require'lspconfig'.elmls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.solargraph.setup{}
require'nvim-web-devicons'.setup{}
require("which-key").setup()
local wk = require("which-key")
require("toggleterm").setup()
require("bufferline").setup{
  direction = 'float',
}

require'diffview'.setup {}
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
    follow_current_file = false,
    window = {
      position = "float",
    }
  },
})
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function rspec_test_file()
  local path = vim.fn.expand('%')
  return require('toggleterm').exec(('rspec %s'):format(path), 1)
end
function rubocop_file()
  local path = vim.fn.expand('%')
  return require('toggleterm').exec(('bundle exec rubocop %s -a'):format(path), 1)
end

function rspec_test_line()
  local path = vim.fn.expand('%')
  local lnum = vim.fn.line('.')
  return require('toggleterm').exec(('rspec %s:%d'):format(path, lnum), 1)
end

vim.cmd('autocmd FileType ruby lua whichkeyRuby()')

_G.whichkeyRuby = function()
  local wk = require("which-key")
  wk.register({
    r = {
      name = "Ruby",
      t = {
        name = "Test",
        f = { "<cmd>lua rspec_test_file()<cr>", "File" },
        l = { "<cmd>lua rspec_test_line()<cr>", "Line" },
      },
      l = { "<cmd>lua rubocop_file()<cr>", "lint" },
    },
  }, { prefix = "<leader>" })
end

wk.register({
  [" "] = {
    name = "Hop",
    w = { "<cmd>HopWord<cr>", "Word" },
    l = { "<cmd>HopLine<cr>", "Line" },
    p = { "<cmd>HopPattern<cr>", "Pattern" },
  },
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    n = { "<cmd>enew<cr>", "New File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
  d = { "<cmd>NeoTreeReveal<cr>", "NeoTree" },
  s = {
    name = "Search",
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    w = { function()
      local cursor_word = vim.fn.expand("<cword>")
      vim.cmd("Telescope grep_string search=" .. cursor_word)
    end, "Word" },
    f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
  },
  y = {
    name = "Yank",
    y = { "<cmd>FZFNeoyank<cr>", "Search yanks" },
    y = { "<cmd>FZFNeoyankSelection<cr>", "", mode = "v" },
  },
  t = {
    name = "Term",
    t = { "<cmd>exe v:count1 . \"ToggleTerm direction=float\"<cr>", "Toggle Term" },
    l = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
  },
  b = {
    name = "Buffer",
    o = { "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "Close Other Buffers" },
    c = { "<cmd>BufferLinePickClose<cr>", "Pick Close Buffer" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close Buffers Right" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close Buffers Left" },
  },
  l = {
    name = "LSP",
    r = { "<cmd>Telescope lsp_references<cr>",	"Lists LSP references for word under the cursor" },
    d = { "<cmd>Telescope lsp_document_symbols<cr>",	"Lists LSP document symbols in the current buffer" },
    w = { "<cmd>Telescope lsp_workspace_symbols<cr>",	"Lists LSP document symbols in the current workspace" },
    c = { "<cmd>Telescope lsp_code_actions<cr>",	"Lists any LSP actions for the word under the cursor, that can be triggered with <cr>" },
    C = { "<cmd>Telescope lsp_range_code_actions<cr>",	"Lists any LSP actions for a given range, that can be triggered with <cr>" },
    D = { "<cmd>Telescope diagnostics<cr>",	"Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer." },
    i = { "<cmd>Telescope lsp_implementations<cr>",	"Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope" },
    d = { "<cmd>Telescope lsp_definitions<cr>",	"Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>",	"Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope" },
  },
}, { prefix = "<leader>" })

require('Comment').setup()

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  completion = { autocomplete = true },
  sources = {
    { name = 'buffer',
      opts = { keyword_pattern = [=[[^[:blank:]].*]=] }
    },
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local actions = require("telescope.actions")
require'telescope'.setup{
  defaults = {
    selection_caret = '->',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = {
        preview_width = 0.3,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer
        },
      }
    },
  },
}
require('telescope').load_extension('fzf')
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
    disabled_filetypes = {}
  },
}

EOF

if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
  set undodir=~/.nvim-undo-dir
endif
