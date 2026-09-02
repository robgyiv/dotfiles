return {
  {
    "stevearc/conform.nvim",
    opts = {

      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff", "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
      },
      formatters = {
        prettierd = {
          condition = function(self, ctx)
            return vim.fs.find({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.js",
              ".prettierrc.yml",
              "prettier.config.js",
              "prettier.config.cjs",
            }, { path = ctx.dirname, upward = true })[1] ~= nil
          end,
        },
      },
    },
  },
}
