local bo = vim.bo
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo

o.autoread = true
o.background = 'dark'
o.clipboard = 'unnamedplus'
o.colorcolumn = '80,120'
o.cursorline = true
-- o.foldexpr= 'nvim_treesitter#foldexpr()'
-- o.foldmethod= 'expr'
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.lazyredraw = true
o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.title = true
o.termguicolors = true
o.syntax = true

-- vim.cmd[[colorscheme oxocarbon]]
-- vim.cmd("colorscheme spaceduck")
vim.cmd("colorscheme oxocarbon")

g.neoformat_run_all_formatters = 1
g.neoformat_enabled_javascript = {'prettier-eslint'}
g.neoformat_enabled_typescript = {'prettier-eslint'}
g.neoformat_enabled_python = {'isort', 'black'}
g.neoformat_enabled_sbt = {'scalafmt'}
g.neoformat_enabled_scala = {'scalafmt'}
g.neoformat_enabled_lua = {'luaformatter'}
g.neoformat_enabled_markdown = {'prettierd'}

g.netrw_liststyle = 3

require("lualine").setup({
  options = {
    theme = 'spaceduck',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    -- lualine_a = {
    --   {
    --     'buffers',
    --     show_filename_only = true
    --     -- mode = 3
    --   },
    --   {
    --     'filename',
    --     path = 1
    --   },
    --   {
    --     'tabs',
    --     mode = 0
    --   }
    -- }
  }
})

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
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
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

require('telescope').setup{
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "-L", "--hidden", "--glob", "!.git/*" },
    }
  }
}

-- require("mason").setup()
-- require("mason-lspconfig").setup()

-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- vim.cmd[[autocmd BufWritePre * undojoin | Neoformat]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.api.nvim_command('augroup fmt')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd BufWritePre * undojoin | Neoformat')
vim.api.nvim_command('augroup END')

