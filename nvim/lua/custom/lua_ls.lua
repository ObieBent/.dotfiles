-- lua/custom/lua_ls.lua
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        -- LuaJIT pour Neovim
        version = "LuaJIT",
        -- charger package.path pour require « core », etc.
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- global vim
        globals = { "vim" },
      },
      workspace = {
        -- indexer : tout le runtime de Neovim
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
