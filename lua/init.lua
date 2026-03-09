-- init.lua

-- configure LSP clients

-- set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

require('lean').setup{
 abbreviations = { builtin = true },
 mappings = true,
}


vim.lsp.enable('clojure_lsp')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')

vim.lsp.config('julials', {
    root_markers = { 'Project.toml', 'JuliaProject.toml', '.git' },
  })
vim.lsp.enable('julials')

vim.keymap.set('n', '<M-h>', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<M-n>', function() vim.diagnostic.goto_prev() end)

-- end
