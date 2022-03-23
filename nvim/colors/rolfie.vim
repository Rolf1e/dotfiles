" # Colors
" for i in {0..255} ; do
"   printf "\x1b[38;5;${i}mcolour${i} "
" done
" palette

set syntax=off

let g:palette = { 
      \  'white': '#fbf1c7', 
      \  'white_blue': '#a9b7c6', 
      \  'dark_grey': '#2b2b2b', 
      \  'light_grey': '#928374',
      \  'transparent': '#32302f',
      \  'dark_green': '#6a8759', 
      \  'green': '#a9b665', 
      \  'violet': '#d3869b', 
      \  'blue': '#7daea3', 
      \  'red': '#ea6962',
      \  'bold_red': '#ff0000',
      \  'dark_red': '#cc241d',
      \  'orange': '#fe8019',
      \  'NONE': 'NONE',
      \ }

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
    execute 'highlight ' . section . ' guifg=' . a:palette[color_str[0]] . ' guibg=' . a:palette[color_str[1]] . ' gui=NONE'
  endfor
endfunction

call ApplyHighlights(g:sections, g:palette)
