
let g:default_sql_config = {
      \ "clickhouse" : {
        \ "command": "clickhouse-client",
        \ "params" : {
          \ "host": "localhost",
          \ "port": "50029",
          \ "format": "Pretty",
          \ },
        \ }
      \ }

function! s:display_result_in_popup(lines) abort
  " Define the size of the floating window
  let width = 50
  let height = 10

  " Create the scratch buffer displayed in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " Get the current UI
  let ui = nvim_list_uis()[0]

  " Create the floating window
  let opts = {
        \ 'relative': 'editor',
        \ 'width': width,
        \ 'height': height,
        \ 'col': (ui.width/2) - (width/2),
        \ 'row': (ui.height/2) - (height/2),
        \ 'anchor': 'NW',
        \ 'style': 'minimal',
        \ }
  let win = nvim_open_win(buf, 1, opts)

  call nvim_buf_set_lines(buf, 0, -1, v:false, a:lines)
endfunction

function! s:run_sql(config, query)                         
  let binary = a:config['command']
  if !executable(binary)
    echo "cannot find ".binary." executable"
    return 
  endif

  let params = ""
  for [param, value] in items(a:config['params'])
    let params = params." --".param." ".value
  endfor

  let result = system(binary.params, a:query)
  let sane = substitute(substitute(result, '\e[1m', '', 'g') , '\e[0m', '', 'g')
  call s:display_result_in_popup(split(sane, "\n"))
endfunction


function! s:get_visual_selection() abort
  try
    let a_save = @a
    silent! normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! s:run_sql_range() range
  if !has_key(g:default_sql_config, &filetype)
    echo "no sql config found for " . &filetype
    return
  endif 

  let config = g:default_sql_config[&filetype]

  return s:run_sql(config, s:get_visual_selection())
endfunction

au BufRead,BufNewFile *.clickhouse		set filetype=clickhouse

command! -range RunSqlRange '<,'> call s:run_sql_range()
