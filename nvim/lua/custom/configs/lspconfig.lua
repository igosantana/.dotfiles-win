local capabilities = require("plugins.configs.lspconfig").capabilities
local on_attach = require("plugins.configs.lspconfig").on_attach

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "pyright" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local omnisharp_bin = "C:\\Users\\USER\\AppData\\Local\\omnisharp\\OmniSharp"
local pid = vim.fn.getpid()
--
-- lspconfig.pyright.setup { blabla}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
}

lspconfig.angularls.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact" },
  cmd = { "angular-language-server", "--stdio" },
  capabilities = capabilities,
}

lspconfig.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  filetypes = { "cs" },
  on_attach = on_attach,
  capabilities = capabilities,
}
