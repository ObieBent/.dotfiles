local stack = require "custom.stack"

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.config("helm_ls", {
  filetypes = { "yaml" },
  root_markers = { "Chart.yaml", ".git" },
  settings = {
    ["helm-ls"] = {
      logLevel = "info",
      valuesFiles = {
        mainValuesFiles = "values.yaml",
        lintOverlayValuesFiles = "values.lint.yaml",
        additionalValuesFilesGlobPatter = "values*.yaml",
      },
      yamlls = {
        path = "yaml-language-server",
        enabled = true,
        enabledForFilesGlob = "*.{yaml,yml}",
        diagnosticsLimit = 50,
        showDiagnosticsDirectly = false,
        initTimeoutSeconds = 3,
        config = {
          schemas = {
            kubernetes = "templates/**",
          },
          completion = true,
          hover = true,
        },
      },
      helmLint = {
        enabled = true,
        ignoredMessages = {},
      },
    },
  },
})

vim.lsp.config("pyright", {
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})

vim.lsp.config("ruff", {
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
})

vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.ansible" },
  root_markers = { ".git", "ansible.cfg", "pyproject.toml" },
  settings = {
    yaml = {
      keyOrdering = false,
      format = { enable = true },
      validate = true,
      schemaStore = {
        enable = true,
      },
    },
  },
})

vim.lsp.config("ansiblels", {
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible", "ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint", ".git" },
  on_new_config = function(new_config, root_dir)
    local candidates = { root_dir .. "/.venv", root_dir .. "/venv" }
    local selected_venv
    local selected_bin

    for _, venv in ipairs(candidates) do
      local bin = venv .. "/bin"
      if vim.fn.isdirectory(bin) == 1 then
        selected_venv = venv
        selected_bin = bin
        break
      end
    end

    if not selected_bin then
      return
    end

    local local_ansiblels = selected_bin .. "/ansible-language-server"
    if vim.fn.executable(local_ansiblels) == 1 then
      new_config.cmd = { local_ansiblels, "--stdio" }
    end

    local sep = vim.loop.os_uname().sysname:match "Windows" and ";" or ":"
    local path = selected_bin .. sep .. (vim.env.PATH or "")
    new_config.cmd_env = vim.tbl_extend("force", new_config.cmd_env or {}, {
      PATH = path,
      VIRTUAL_ENV = selected_venv,
    })
  end,
})

for _, server in ipairs(stack.lsp_servers) do
  vim.lsp.enable(server)
end
