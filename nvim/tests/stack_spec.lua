local function fail(msg)
  io.stderr:write(msg .. "\n")
  os.exit(1)
end

local function assert_true(cond, msg)
  if not cond then
    fail(msg)
  end
end

local function assert_has(tbl, value, msg)
  for _, v in ipairs(tbl) do
    if v == value then
      return
    end
  end
  fail(msg)
end

local function plugin_names(plugins)
  local names = {}
  for _, spec in ipairs(plugins) do
    if type(spec) == "string" then
      names[spec] = true
    elseif type(spec) == "table" and type(spec[1]) == "string" then
      names[spec[1]] = true
    end
  end
  return names
end

local ok_stack, stack = pcall(require, "custom.stack")
assert_true(ok_stack, "custom.stack module is missing")

assert_has(stack.lsp_servers, "gopls", "missing gopls in lsp_servers")
assert_has(stack.lsp_servers, "pyright", "missing pyright in lsp_servers")
assert_has(stack.lsp_servers, "ruff", "missing ruff in lsp_servers")
assert_has(stack.lsp_servers, "yamlls", "missing yamlls in lsp_servers")
assert_has(stack.lsp_servers, "ansiblels", "missing ansiblels in lsp_servers")

assert_has(stack.mason_tools, "delve", "missing delve in mason_tools")
assert_has(stack.mason_tools, "debugpy", "missing debugpy in mason_tools")
assert_has(stack.mason_tools, "ansible-language-server", "missing ansible-language-server in mason_tools")
assert_has(stack.mason_tools, "yaml-language-server", "missing yaml-language-server in mason_tools")

local plugins = dofile(vim.fn.stdpath("config") .. "/lua/custom/plugins.lua")
local names = plugin_names(plugins)
assert_true(names["mfussenegger/nvim-dap"], "missing nvim-dap plugin")
assert_true(names["rcarriga/nvim-dap-ui"], "missing nvim-dap-ui plugin")
assert_true(names["leoluz/nvim-dap-go"], "missing nvim-dap-go plugin")
assert_true(names["mfussenegger/nvim-dap-python"], "missing nvim-dap-python plugin")
assert_true(names["nvim-neotest/neotest"], "missing neotest plugin")
assert_true(names["stevearc/conform.nvim"], "missing conform.nvim plugin")
assert_true(names["mfussenegger/nvim-lint"], "missing nvim-lint plugin")

-- force-load custom LSP setup in headless test context
dofile(vim.fn.stdpath("config") .. "/lua/custom/configs/lspconfig.lua")

assert_true(vim.lsp.is_enabled("gopls"), "gopls should be enabled")
assert_true(vim.lsp.is_enabled("pyright"), "pyright should be enabled")
assert_true(vim.lsp.is_enabled("ruff"), "ruff should be enabled")
assert_true(vim.lsp.is_enabled("yamlls"), "yamlls should be enabled")
assert_true(vim.lsp.is_enabled("ansiblels"), "ansiblels should be enabled")

print("stack_spec: OK")
