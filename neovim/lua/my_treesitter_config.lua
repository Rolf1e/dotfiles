
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
    rainbow = {
      enable = true,
      disable = {'bash'} -- please disable bash until I figure #1 out
    },
    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = true,
      },
    },
  }

