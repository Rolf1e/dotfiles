local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=Blue
      hi LspReferenceText cterm=bold ctermbg=red guibg=Blue
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=Blue

      hi link LspDiagnosticsVirtualTextError Red
      hi link LspDiagnosticsVirtualTextWarning Yellow
      hi link LspDiagnosticsVirtualTextInformation Grey
      hi link LspDiagnosticsVirtualTextHint White

      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver", "bashls", "hls", "jedi_language_server", "ccls", "cssls", "texlab", "phpactor"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp["rust_analyzer"].setup({
    on_attach=on_attach,
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

nvim_lsp["elixirls"].setup {
    cmd = { "/home/rolfie/software/elixir-ls/language_server.sh"},
}

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/rolfie/software/omnisharp-linux-x64/run"
nvim_lsp["omnisharp"].setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
  on_attach = on_attach,
}


