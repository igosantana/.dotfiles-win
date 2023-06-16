local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {
    filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "scss", "css", "less" },
  }, -- ts, js formater
  b.diagnostics.stylelint, -- css lint
  b.diagnostics.eslint_d, -- ts, js lint
  b.formatting.gofmt, -- golang formater
  b.diagnostics.ruff, --python lint
  b.formatting.black, -- python formater
  b.formatting.csharpier.with { filetypes = { "cs" } }, -- c# formater

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
