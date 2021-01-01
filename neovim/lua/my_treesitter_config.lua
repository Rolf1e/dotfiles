
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,              
  },
  rainbow = {
    enable = true,
    disable = {'bash'} -- please disable bash until I figure #1 out
  }
}

--"lua << EOF
--"require'nvim-treesitter.configs'.setup {
  --"ensure_installed = "maintained", 
  --"highlight = {
    --"enable = true,              
  --"},
  --"refactor = {
    --"navigation = {
      --"enable = true,
      --"keymaps = {
        --"goto_definition = "gnd",
        --"list_definitions = "gnD",
        --"list_definitions_toc = "gO",
        --"goto_next_usage = "<a-*>",
        --"goto_previous_usage = "<a-#>",
      --"},
    --"},
  --"},
--"}
--"EOF
