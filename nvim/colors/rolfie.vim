" Inspired by Gruvbox, Gruvbox-material and Darcula
" # Colors
" for i in {0..255} ; do
"   printf "\x1b[38;5;${i}mcolour${i} "
" done
" palette

set syntax=off

function! ReadPaletteFromConfigFile()
  let content = readfile($HOME . '/.config/.rolfie_colors.json')
  return json_decode(content)
endfunction

let g:palette = ReadPaletteFromConfigFile() 

let g:sections = {
  \ 'Identifier': ['white', 'NONE'],
  \ 'Delimiter': ['white', 'NONE'],
  \ 'Special': ['dark_red', 'NONE'],
  \ 'SpecialChar': ['orange', 'NONE'],
  \ 'LineNr': ['light_grey', 'NONE'],
  \ 'Keyword': ['red', 'NONE'],
  \ 'Operator': ['white', 'NONE'],
  \ 'Conditional': ['red', 'NONE'],
  \ 'Repeat': ['red', 'NONE'],
  \ 'Function': ['green', 'NONE'],
  \ 'Type': ['orange', 'NONE'],
  \ 'Typedef': ['orange', 'NONE'],
  \ 'Include': ['orange', 'NONE'],
  \ 'Statement': ['blue', 'NONE'],
  \ 'Comment': ['light_grey', 'NONE'],
  \ 'cComment': ['light_grey', 'NONE'],
  \ 'String': ['dark_green', 'NONE'],
  \ 'Constant': ['violet', 'NONE'],
  \ 'Error': ['bold_red', 'NONE'],
  \ 'StatusLine': ['white_blue', 'transparent'],
  \ 'StatusLineNC': ['white_blue', 'transparent'],
  \ 'Folded': ['white_blue', 'transparent'],
  \ 'Pmenu': ['white_blue', 'transparent'],
  \ 'Title': ['white_blue', 'transparent'],
  \ 'Visual': ['light_grey', 'transparent'],
  \ 'ColorColumn': ['light_grey', 'transparent'],
  \ 'VertSplit': ['light_grey', 'transparent'],
  \ 'TabLineFill': ['light_grey', 'transparent'],
  \ 'NonText': ['NONE', 'NONE'],
  \ 'Directory': ['green', 'NONE'],
  \ 'DiffAdd': ['green', 'NONE'],
  \ 'DiffChange': ['green', 'NONE'],
  \ 'DiffDelete': ['bold_red', 'NONE'],
\}

function! ApplyHighlights(sections, palette)
  for [section, color_str] in items(a:sections)
    execute 'highlight ' . section . ' guifg=' . a:palette['rolfie_'.color_str[0]]['hexa'] . ' guibg=' . a:palette['rolfie_'.color_str[1]]['hexa'] . ' gui=NONE'
  endfor
endfunction

function! TransparentBackGroundOn()
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
endfunction

function! TransparentBackGroundOff()
  highlight Normal guibg=Black
  highlight NonText guibg=Black
  highlight Normal ctermbg=Black
  highlight NonText ctermbg=Black
endfunction

call ApplyHighlights(g:sections, g:palette)
call TransparentBackGroundOn()
