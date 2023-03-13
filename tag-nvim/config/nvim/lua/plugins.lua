vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
  use 'nvim-treesitter/nvim-treesitter-context'

  use {'liuchengxu/space-vim-theme'}

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  -- https://github.com/simrat39/rust-tools.nvim/
  use 'simrat39/rust-tools.nvim'
  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- use 'jose-elias-alvarez/typescript'

  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

  use { 'ms-jpq/coq_nvim', branch = 'coq', run = 'python3 -m coq deps' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-fugitive'
  use 'itchyny/lightline.vim'
  use 'sbdchd/neoformat'
  use 'Th3Whit3Wolf/space-nvim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-vinegar'
  use 'christoomey/vim-tmux-navigator'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/tokyonight.nvim'
  use { 'pineapplegiant/spaceduck', branch = 'dev' }
  use {'nyoom-engineering/oxocarbon.nvim'}

end)

