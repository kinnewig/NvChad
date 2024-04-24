local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local coq = require "coq"

lspconfig.clangd.setup({
  coq.lsp_ensure_capabilities({
    cmd = {
      "/usr/bin/clangd", "--background-index", "--query-driver=/opt/AMD/aocc-compiler-4.2.0/bin/clang++"
    },

    -- minor bug fix
    on_attach = function (client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities
  })
})
