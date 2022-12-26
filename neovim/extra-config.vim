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
" map /  <plug>(incsearch-forward)
" map ?  <plug>(incsearch-backward)
" map g/ <plug>(incsearch-stay)

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


  Plug 'bluz71/vim-moonfly-colors'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'kyazdani42/nvim-web-devicons' " lua
  Plug 'MunifTanjim/nui.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'wlangstroth/vim-racket'
  Plug 'folke/which-key.nvim'
  Plug 'APZelos/blamer.nvim'
  Plug 'github/copilot.vim'
  Plug 'kristijanhusak/orgmode.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons' " vimscript
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'pwntester/octo.nvim'

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
  Plug 'MunifTanjim/nui.nvim'
  " Plug 'rcarriga/nvim-notify'
  " Plug 'folke/noice.nvim'
  Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
  Plug 'stevearc/aerial.nvim'
  Plug 'ggandor/lightspeed.nvim'

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
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all"
  ensure_installed = "all",
  highlight = {
    enable = false,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incnemental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
  refactor = {
    highlight_current_scope = { enable = false },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
})
require("nvim-tree").setup({
  update_cwd = false,
  prefer_startup_root = true,
  sync_root_with_cwd = false,
  sort_by = "case_sensitive",
  actions = {
    open_file = {
      quit_on_open = true,
    },
    change_dir = {
      enable = false,
      global = false,
      restrict_above_cwd = true,
    },
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
})

require"octo".setup()
require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  open_automatic = false,
  show_guides = true,
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
vim.cmd("colorscheme moonfly")

-- require'noice'.setup(
--   {
--     views = {
--       cmdline_popup = {
--         border = {
--           style = "rounded",
--           padding = { 0, 1 },
--         },
--         position = {
--           row = 2,
--           col = "50%",
--         },
--       },
--     },
--   }
-- )
require'lspconfig'.elmls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.solargraph.setup{}
require'nvim-web-devicons'.setup{}
require("which-key").setup()
local wk = require("which-key")
require("toggleterm").setup()
require("bufferline").setup{
  direction = 'float',
}

require'diffview'.setup {}
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
  [" "] = { "<cmd>HopWord<cr>", "Hop Word" },
  ["h"] = {
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
    t = { "<cmd>Telescope treesitter<cr>", "treesitter" },
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
    o = { "<cmd>AerialToggle!<CR>", "Display code outline" },
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
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}
require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

EOF

if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
  set undodir=~/.nvim-undo-dir
endif
