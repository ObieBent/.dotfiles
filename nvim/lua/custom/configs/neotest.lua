local M = {}

function M.setup()
  local neotest = require "neotest"

  neotest.setup {
    adapters = {
      require "neotest-go",
      require("neotest-python") {
        runner = "pytest",
        python = function()
          return vim.fn.exepath "python3"
        end,
      },
    },
  }
end

return M
