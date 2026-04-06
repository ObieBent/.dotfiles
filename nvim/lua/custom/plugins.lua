local stack = require "custom.stack"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = stack.mason_tools
      return opts
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Lazygit" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = require("custom.chadrc").on_attach_nvim_tree,
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = false,
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = function()
      return require "custom.configs.conform"
    end,
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile", "BufWritePost", "InsertLeave" },
    config = function()
      require("custom.configs.lint").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    init = function()
      require("core.utils").load_mappings "dap"
    end,
    config = function()
      require("custom.configs.dap").setup()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    dependencies = { "mfussenegger/nvim-dap" },
    init = function()
      require("core.utils").load_mappings "dap_go"
    end,
    config = function()
      require("dap-go").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local mason_python = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      local python = vim.fn.executable(mason_python) == 1 and mason_python or vim.fn.exepath "python3"
      require("dap-python").setup(python)
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = { "go" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      require("core.utils").load_mappings "gopher"
    end,
    opts = {},
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
    },
    init = function()
      require("core.utils").load_mappings "neotest"
    end,
    config = function()
      require("custom.configs.neotest").setup()
    end,
  },

  {
    "pearofducks/ansible-vim",
    ft = { "yaml", "yaml.ansible", "ansible" },
  },

  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = {},
    keys = {
      {
        "<leader>rr",
        function()
          require("grug-far").open()
        end,
        desc = "Replace in project",
      },
      {
        "<leader>rw",
        function()
          require("grug-far").open {
            prefills = { search = vim.fn.expand "<cword>" },
          }
        end,
        desc = "Replace current word in project",
      },
    },
  },

  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
    opts = {
      border = "rounded",
      width_ratio = 0.9,
      height_ratio = 0.9,
    },
    keys = {
      {
        "<leader>mr",
        function()
          if vim.fn.executable "glow" == 0 then
            vim.notify("glow CLI manquant. Installe-le avec: brew install glow", vim.log.levels.WARN)
            return
          end
          vim.cmd "Glow"
        end,
        desc = "Markdown rendu (Glow)",
      },
    },
  },
}

return plugins
