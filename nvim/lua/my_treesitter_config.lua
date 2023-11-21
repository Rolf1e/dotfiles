
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
    "c", "rust",
    "java", "scala",
    "bash", "python",  "lua",
    "javascript", "typescript",
    "hcl", "erlang", "elixir", "go"
    },
    auto_install = true,
    highlight = {
      enable = true,              
    },
    indent = {
      enable = true
    },
  }

