local plugins = {
  -- Offical LSP (Language Server Protocol)
  --   necessary for autocompletion
  {
    "neovim/nvim-lspconfig",
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

      }
    }
  }
}
return plugins
