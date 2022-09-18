local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')

local servers = {
  -- "tsserver",
  -- "bashls",
  -- "jedi_language_server",
  -- "html",
  -- "cssls",
  -- "ccls",
  -- "dartls",
  "metals"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { capabilities = capabilities }
end

nvim_lsp["rust_analyzer"].setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
