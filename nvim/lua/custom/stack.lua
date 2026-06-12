local M = {}

M.lsp_servers = {
  "lua_ls",
  "gopls",
  "pyright",
  "ruff",
  "yamlls",
  "ansiblels",
  "helm_ls",
  "markdownlint",
  "bashls",
  "clangd",
  "vimls",
  "rust_analyzer",
  "terraformls",
  "dockerls",
  "jsonls",
}

M.mason_tools = {
  "lua-language-server",
  "stylua",
  "gopls",
  "goimports",
  "gofumpt",
  "golines",
  "delve",
  "pyright",
  "ruff",
  "black",
  "isort",
  "debugpy",
  "yaml-language-server",
  "yamlfmt",
  "yamllint",
  "ansible-language-server",
  "ansible-lint",
}

return M
