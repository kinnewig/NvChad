local plugins = {
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
        "clangd"
      }
    }
  }
}
return plugins
