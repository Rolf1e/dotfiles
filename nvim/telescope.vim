"telescope
lua require("my_telescope_config")
"telescope vim
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>g <cmd>Telescope git_status<cr>
nnoremap <A-p> <cmd>Telescope buffers show_all_buffers=true<cr>
