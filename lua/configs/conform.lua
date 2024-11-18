local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    -- cssls = { "prettier" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    java = {
      "google-java-format",
      command = "java",
      args = {
        "-jar",
        vim.fn.expand "~/.local/share/nvim/mason/packages/google-java-format/google-java-format-1.24.0-all-deps.jar",
        "-",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
