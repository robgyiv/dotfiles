-- local development
vim.opt.runtimepath:prepend("$HOME/code/github.com/robgyiv/git-web-line.nvim")

require("plugins") -- lua/plugins.lua
require("settings") -- lua/settings.lua
require("maps") -- lua/maps.lua
require("lsp") -- lua/lsp.lua
require("treesitter") -- lua/treesitter.lua
