local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

options = { noremap = true }
map('n', '<c-j>', '<c-w>j', options) 
map('n', '<c-k>', '<c-w>k', options) 
map('n', '<c-h>', '<c-w>h', options) 
map('n', '<c-l>', '<c-w>l', options) 


-- telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', options)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', options)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', options)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', options)

require('lspconfig')   -- lua/lspconfig.lua
