local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- if client.resolved_capabilities.document_highlight then
  -- vim.api.nvim_exec([[
   -- ]], false)
  -- end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver", "bashls", "jedi_language_server", "html", "cssls", "ccls", "dartls"}
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

-- local jdtls_path = '/home/rolfie/software/eclipse.jdtls'
-- local equinox_version = '1.6.400.v20210924-0641'
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/home/rolfie/software/eclipse.jdtls/.workspace/' .. project_name
-- -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local jdtls_config = {
  -- -- The command that starts the language server
  -- -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  -- cmd = {
-- 
    -- -- 💀
    -- 'java', -- or '/path/to/java17_or_newer/bin/java'
            -- -- depends on if `java` is in your $PATH env variable and if it points to the right version.
-- 
    -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    -- '-Dosgi.bundles.defaultStartLevel=4',
    -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
    -- '-Dlog.protocol=true',
    -- '-Dlog.level=ALL',
    -- '-Xms1g',
    -- '--add-modules=ALL-SYSTEM',
    -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
-- 
    -- -- 💀
    -- '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_'.. equinox_version ..'.jar',
         -- -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- -- Must point to the                                                     Change this to
         -- -- eclipse.jdt.ls installation                                           the actual version
-- 
-- 
    -- -- 💀
    -- '-configuration', jdtls_path .. '/config_linux',
                    -- -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- -- eclipse.jdt.ls installation            Depending on your system.
-- 
-- 
    -- -- 💀
    -- -- See `data directory configuration` section in the README
    -- '-data', workspace_dir
  -- },
-- 
  -- -- 💀
  -- -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
-- 
  -- -- Here you can configure eclipse.jdt.ls specific settings
  -- -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- -- for a list of options
  -- settings = {
    -- java = {
    -- }
  -- },
-- 
  -- -- Language server `initializationOptions`
  -- -- You need to extend the `bundles` with paths to jar files
  -- -- if you want to use additional eclipse.jdt.ls plugins.
  -- --
  -- -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  -- --
  -- -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  -- init_options = {
    -- bundles = {}
  -- },
-- }
-- -- This starts a new client & server,
-- -- or attaches to an existing client & server depending on the `root_dir`.
-- require('jdtls').start_or_attach(jdtls_config)


