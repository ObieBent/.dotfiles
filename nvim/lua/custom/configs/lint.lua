local M = {}

function M.setup()
  local lint = require "lint"

  lint.linters_by_ft = {
    python = { "ruff" },
    yaml = { "yamllint" },
    -- ["yaml.ansible"] = { "ansible_lint" },
  }

  local group = vim.api.nvim_create_augroup("CustomLinting", { clear = true })
  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
    group = group,
    callback = function()
      lint.try_lint()
    end,
  })
end

return M
