local nvim_lsp = require'lspconfig'

nvim_lsp.rust_analyzer.setup{on_attach=require'completion'.on_attach}

nvim_lsp.jedi_language_server.setup{on_attach=require'completion'.on_attach}

nvim_lsp.tsserver.setup{on_attach=require'completion'.on_attach}

nvim_lsp.hls.setup{on_attach=require'completion'.on_attach}

nvim_lsp.bashls.setup{on_attach=require'completion'.on_attach}

nvim_lsp.ccls.setup{on_attach=require'completion'.on_attach}

nvim_lsp.jdtls.setup{
  on_attach=require'completion'.on_attach,
  init_options = {
    jvm_args = {"-javaagent:/home/rolfie/.m2/repository/org/projectlombok/lombok/1.18.10/lombok-1.18.10.jar"},
  },
}	

vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

