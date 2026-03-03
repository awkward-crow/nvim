-- init.lua

-- configure LSP clients

-- set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- set configuration for typescript language server
-- vim.lsp.config('ts_ls', {
--   cmd = { 'typescript-language-server', '--stdio' },
--   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
-- })

-- enable typescript language server
-- vim.lsp.enable('ts_ls')


require('lean').setup{
 abbreviations = { builtin = true },
 mappings = true,
}


vim.lsp.enable('clojure_lsp')

vim.lsp.enable('gopls')

-- vim.lsp.enable('basedpyright')

vim.lsp.enable('lua_ls')

vim.lsp.enable('rust_analyzer')

vim.keymap.set('n', '<M-h>', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<M-n>', function() vim.diagnostic.goto_prev() end)

-- end
