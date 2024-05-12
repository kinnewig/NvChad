local plugins = {
  -- Nvim debugger
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },


  -- Debugger Interface --
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "wolliamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  
  -- Debugger GUI --
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies =  {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  -- Dependencie for nvim dap ui
  { "nvim-neotest/nvim-nio" },

  -- Autoforamtting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",-- We do not want this package to impact start up time
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  -- coq
  --   autocompletion tool
  {
    "ms-jpq/coq_nvim",
    dependencies = {
      "ms-jpq/coq.artifacts",
    },
  },

  -- Offical LSP (Language Server Protocol)
  --   necessary for autocompletion
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        clangd = {
          mason = false,
        }
      }
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Mason Package manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb"
      }
    }
  }
}
return plugins
