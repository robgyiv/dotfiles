return {
  -- add custom oxocarbon
  { "nyoom-engineering/oxocarbon.nvim" },
  { "EdenEast/nightfox.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}
