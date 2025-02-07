vim.keymap.set('n', '-', '<CMD>Lexplore %:p:h<CR>', { desc = 'Open netrw' })

vim.keymap.set('n', 'gwl', '<CMD>GitWebLine<CR>', { desc = 'Open file in git host UI' })

-- Function to copy the file path of the current file to the clipboard
-- @param is_absolute boolean: If true, copy the absolute path, else copy the relative path
local function copy_file_path_to_clipboard(is_absolute)
  local path = is_absolute and vim.fn.expand '%:p' or vim.fn.expand '%'
  vim.fn.setreg('+', path)
end

-- Set keymaps for copying both relative and absolute paths
vim.keymap.set('n', '<leader>cpr', function()
  copy_file_path_to_clipboard(false)
end, { noremap = true, silent = true, desc = 'Copy relative path to clipboard' })
vim.keymap.set('n', '<leader>cpa', function()
  copy_file_path_to_clipboard(true)
end, { noremap = true, silent = true, desc = 'Copy absolute path to clipboard' })

-- Telescope reloader for plugin development
vim.keymap.set('n', '<leader>fr', '<CMD>lua require("telescope.builtin").reloader()<CR>', { desc = 'Reload Telescope' })
