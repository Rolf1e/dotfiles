
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
    "c", "rust",
    "java", "scala",
    "bash", "python",  "lua",
    "javascript", "typescript",
    "hcl"
  },
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
  }

