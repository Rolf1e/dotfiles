" rely on shell script resolve_nvim_dadbod_config
" that is symlinked in /usr/local/bin
function! s:resolve_urls()
  let json_output = system('resolve_nvim_dadbod_config')
  let urls = json_decode(json_output)
  return urls
endfunction

let g:dbs = s:resolve_urls()
echo g:dbs
