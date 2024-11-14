local api = vim.api
local cmd = vim.cmd


api.nvim_set_keymap("n", "<leader>o", "<cmd>MetalsOrganizeImports<CR>", { noremap = true })

local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

require('metals').initialize_or_attach(metals_config)

