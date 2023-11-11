local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    --javascript = { "prettier" },
    --javascriptreact = { "prettier" },
    --typescript = { "prettier" },
    --typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },

    --json = { "prettier" },
    sh = { "shfmt", "shellcheck" },
    go = { "goimports", "gofmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

require("conform").setup(options)
