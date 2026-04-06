local M = {
  notify_on_error = true,
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt", "golines" },
    python = { "isort", "black" },
    yaml = { "yamlfmt" },
    ["yaml.ansible"] = { "yamlfmt" },
  },
  format_on_save = function(bufnr)
    return {
      timeout_ms = 1500,
      lsp_format = "fallback",
      bufnr = bufnr,
    }
  end,
}

return M
