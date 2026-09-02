return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      hidden = true,
      ignored = false,
    },
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
        grep = {
          hidden = true,
          ignored = false,
        },
        grep_word = {
          hidden = true,
          ignored = false,
        },
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
