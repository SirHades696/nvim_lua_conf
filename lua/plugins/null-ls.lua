-----------------------------------------------------------
-- Null-ls configuration file
-----------------------------------------------------------

-- Plugin: null-ls
-- url: https://github.com/jose-elias-alvarez/null-ls.nvim

local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- url sources: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
  formatting.black, -- "python"
  formatting.eslint_d, -- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue"
  formatting.json_tool, -- "json"
  formatting.phpcsfixer, --  "php"
  formatting.prettier, -- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html"
  formatting.djhtml, --django
  formatting.djlint, -- formt html
}

null_ls.setup({
  sources = sources,
  on_attach = function(client)
    if client.supports_method"textDocument/formatting" then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
