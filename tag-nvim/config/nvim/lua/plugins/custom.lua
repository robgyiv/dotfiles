return {
  {
    "robgyiv/git-web-line.nvim",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = "python", -- Load when opening Python files
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("minuet").setup({
  --       -- Use FIM-style completion via Ollama
  --       provider = "openai_fim_compatible",
  --
  --       -- Good defaults for local models
  --       n_completions = 1, -- don’t spam local model
  --       context_window = 512, -- start small, bump if it’s fast enough
  --       throttle = 250,
  --       debounce = 250,
  --
  --       -- Provider-specific config MUST go here:
  --       provider_options = {
  --         openai_fim_compatible = {
  --           -- Name of an *environment variable*, not the literal key.
  --           -- HOME works as a dummy for Ollama as long as $HOME is set.
  --           -- Alternatively, create your own:
  --           --   export OLLAMA_DUMMY_API_KEY=1
  --           --   api_key = "OLLAMA_DUMMY_API_KEY",
  --           api_key = "HOME",
  --           name = "Ollama",
  --           end_point = "http://localhost:11434/v1/completions",
  --           model = "qwen2.5-coder:7b",
  --           stream = true,
  --           optional = {
  --             max_tokens = 512,
  --             temperature = 0.2,
  --             top_p = 0.95,
  --           },
  --         },
  --       },
  --
  --       -- Optional: turn Minuet auto-complete on/off globally for cmp/blink
  --       blink = {
  --         enable_auto_complete = true,
  --       },
  --       cmp = {
  --         enable_auto_complete = true,
  --       },
  --
  --       -- virtualtext.auto_trigger_ft is *only* for the virtual text frontend.
  --       -- You don’t need it when using blink.cmp as the frontend.
  --       -- virtualtext = {
  --       --   auto_trigger_ft = { "python", "lua", ... },
  --       -- },
  --     })
  --   end,
  -- },
  --
  -- Blink.cmp integration (LazyVim already pulls this in)
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   opts = {
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer", "minuet" },
  --       providers = {
  --         minuet = {
  --           name = "minuet",
  --           module = "minuet.blink",
  --           async = true,
  --           timeout_ms = 3000, -- should roughly match minuet.request_timeout * 1000
  --           score_offset = 8, -- higher = prefer minuet over others
  --         },
  --       },
  --     },
  --     completion = {
  --       accept = {
  --         auto_brackets = { enabled = true },
  --       },
  --       -- Recommended in README to avoid extra requests
  --       trigger = {
  --         prefetch_on_insert = true,
  --       },
  --     },
  --   },
  -- },
}
