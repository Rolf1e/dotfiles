
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
    "c", "rust",
    "java", "scala",
    "bash", "python",  "lua",
    "javascript", "typescript"
  },
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
  }

