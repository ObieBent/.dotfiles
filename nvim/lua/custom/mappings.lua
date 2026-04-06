local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
    ["<leader>drc"] = { "<cmd> DapContinue <CR>", "Debug continue" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "Debug step into" },
    ["<leader>do"] = { "<cmd> DapStepOver <CR>", "Debug step over" },
    ["<leader>dO"] = { "<cmd> DapStepOut <CR>", "Debug step out" },
    ["<leader>drt"] = { "<cmd> DapTerminate <CR>", "Debug terminate" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = { "<cmd> GoTagAdd json <CR>", "Add json struct tags" },
    ["<leader>gsy"] = { "<cmd> GoTagAdd yaml <CR>", "Add yaml struct tags" },
  },
}

M.neotest = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      function()
        require("neotest").run.run()
      end,
      "Run nearest test",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run file tests",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle test summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true }
      end,
      "Open test output",
    },
  },
}

M.general = {
  n = {
    ["<leader>dd"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Show Diagnostics at Cursor",
    },
    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Next Diagnostic",
    },
    ["<leader>dp"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Previous Diagnostic",
    },
    ["<leader>dl"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "List All Diagnostics",
    },
    ["<leader>dh"] = {
      function()
        vim.diagnostic.config {
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
          float = {
            show_header = true,
            source = "always",
          },
        }
        vim.diagnostic.open_float()
      end,
      "Show All Diagnostics Including Hints",
    },
    ["<leader>dc"] = {
      function()
        vim.cmd "cclose"
        vim.cmd "lclose"
      end,
      "Fermer Quickfix et Loclist",
    },
    ["<leader>dq"] = { "<cmd>cclose<cr>", "Close Quickfix Window" },
    ["<leader>dt"] = {
      function()
        local config = vim.diagnostic.config()
        config.virtual_text = not config.virtual_text
        vim.diagnostic.config(config)
        if config.virtual_text then
          vim.notify("Diagnostic virtual text enabled", vim.log.levels.INFO)
        else
          vim.notify("Diagnostic virtual text disabled", vim.log.levels.INFO)
        end
      end,
      "Toggle Virtual Text",
    },
    ["<leader>df"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Quick Fix / Code Actions",
    },
    ["<leader>gb"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "Git blame line",
    },
  },
}

return M
