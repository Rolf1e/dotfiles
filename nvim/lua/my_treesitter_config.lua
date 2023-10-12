
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
    "c", "rust",
    "java", "scala",
    "bash", "python",  "lua",
    "javascript", "typescript",
    "hcl", "erlang", "elixir"
    },
    auto_install = true,
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
  }

