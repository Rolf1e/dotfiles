local util = require 'lspconfig.util'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').gopls.setup({
  capabilities = capabilities,
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support =  true
})

