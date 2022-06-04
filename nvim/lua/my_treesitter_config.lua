
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "rust", "lua", "python", "java", "bash" },
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
  }

