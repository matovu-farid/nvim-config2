local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    eruby = { { "htmlbeautifier", "erb_format" } },
    ruby = { { "rubyfmt", "standardrb" } },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
