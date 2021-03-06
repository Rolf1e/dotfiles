local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  --
  --highlight! link LspDiagnosticsDefaultError ErrorLine
  --highlight! link LspDiagnosticsDefaultWarning WarningLine
  --highlight! link LspDiagnosticsDefaultInformation InfoLine
  --highlight! link LspDiagnosticsDefaultHint HintLine
  
  --highlight! link LspDiagnosticsVirtualTextError Grey
  --highlight! link LspDiagnosticsVirtualTextWarning Grey
  --highlight! link LspDiagnosticsVirtualTextInformation Grey
  --highlight! link LspDiagnosticsVirtualTextHint Grey
  
  --highlight! link LspDiagnosticsUnderlineError ErrorLine
  --highlight! link LspDiagnosticsUnderlineWarning WarningLine
  --highlight! link LspDiagnosticsUnderlineInformation InfoLine
  --highlight! link LspDiagnosticsUnderlineHint HintLine
  
  --highlight! link LspDiagnosticsSignError RedSign
  --highlight! link LspDiagnosticsSignWarning YellowSign
  --highlight! link LspDiagnosticsSignInformation BlueSign
  --highlight! link LspDiagnosticsSignHint AquaSign
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
local servers = { "tsserver", "bashls", "hls", "jedi_language_server", "ccls", "cssls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
nvim_lsp["rust_analyzer"].setup { 
   on_attach = on_attach,
   capabilities = capabilities,
}

local pid = vim.fn.getpid()
local omnisharp_bin = "/home/rolfie/software/omnisharp-linux-x64/run"
nvim_lsp["omnisharp"].setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
  on_attach = on_attach,
}
