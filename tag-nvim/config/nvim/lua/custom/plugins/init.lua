-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'robgyiv/git-web-line.nvim',
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      -- You don't need to set any of these options.
      -- IMPORTANT!: this is only a showcase of how you can set default options!
      require('telescope').setup {
        extensions = {
          file_browser = {
            -- theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            -- mappings = {
            --   ['i'] = {
            --     -- your custom insert mode mappings
            --   },
            --   ['n'] = {
            --     -- your custom normal mode mappings
            --   },
            -- },
            hidden = { file_browser = true, folder_browser = true },
            follow_symlinks = true,
          },
        },
      }
      -- To get telescope-file-browser loaded and working with telescope,
      -- you need to call load_extension, somewhere after setup function:
      require('telescope').load_extension 'file_browser'

      vim.keymap.set('n', '<space>fb', function()
        require('telescope').extensions.file_browser.file_browser { path = '%:p:h' }
      end)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        filetypes = {
          markdown = true, -- overrides default
          txt = false, -- disallow specific filetype
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
              -- disable for .env files
              return false
            end
            return true
          end,
        },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
}
