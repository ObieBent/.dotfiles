local function fail(msg)
  io.stderr:write(msg .. "\n")
  os.exit(1)
end

-- Ensure custom LSP config is loaded in this headless test process.
dofile(vim.fn.stdpath("config") .. "/lua/custom/configs/lspconfig.lua")

local function assert_true(cond, msg)
  if not cond then
    fail(msg)
  end
end

local function write_file(path, content)
  local f = assert(io.open(path, "w"))
  f:write(content)
  f:close()
end

local function has_client(bufnr, expected)
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  for _, c in ipairs(clients) do
    if c.name == expected then
      return true, clients
    end
  end
  return false, clients
end

local function open_and_expect(path, expected_client, forced_ft)
  vim.cmd("edit " .. vim.fn.fnameescape(path))
  vim.cmd "filetype detect"
  if forced_ft then
    vim.bo.filetype = forced_ft
    vim.api.nvim_exec_autocmds("FileType", { modeline = false })
  end

  local ok = vim.wait(3000, function()
    local attached = has_client(0, expected_client)
    return attached
  end, 50)

  local attached, clients = has_client(0, expected_client)
  if not ok or not attached then
    local names = {}
    for _, c in ipairs(clients) do
      table.insert(names, c.name)
    end
    fail(("expected client '%s' for %s, got [%s]"):format(expected_client, path, table.concat(names, ",")))
  end
end

local tmp = vim.fn.stdpath "cache" .. "/lsp-attach-spec"
vim.fn.mkdir(tmp, "p")

local go_dir = tmp .. "/go-proj"
local py_dir = tmp .. "/py-proj"
local ansible_dir = tmp .. "/ansible-proj"

vim.fn.mkdir(go_dir, "p")
vim.fn.mkdir(py_dir, "p")
vim.fn.mkdir(ansible_dir, "p")

local go = go_dir .. "/main.go"
local py = py_dir .. "/main.py"
local yaml = ansible_dir .. "/playbook.yml"

write_file(go_dir .. "/go.mod", "module example.com/demo\n\ngo 1.22\n")
write_file(py_dir .. "/pyproject.toml", "[project]\nname = 'demo'\nversion = '0.1.0'\n")
write_file(ansible_dir .. "/ansible.cfg", "[defaults]\ninventory = hosts\n")

write_file(go, "package main\n\nfunc main() {}\n")
write_file(py, "print('ok')\n")
write_file(yaml, "---\n- name: demo\n  hosts: localhost\n  tasks: []\n")

open_and_expect(go, "gopls")
open_and_expect(py, "pyright")
open_and_expect(yaml, "yamlls")
open_and_expect(yaml, "ansiblels", "yaml.ansible")

print("lsp_attach_spec: OK")
