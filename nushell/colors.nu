let rolfie_base00 = "#181818" # Default Background
let rolfie_base01 = "#282828" # Lighter Background (Used for status bars, line number and folding marks)
let rolfie_base02 = "#383838" # Selection Background
let rolfie_base04 = "#b8b8b8" # Dark Foreground (Used for status bars)
let rolfie_base05 = "#d8d8d8" # Default Foreground, Caret, Delimiters, Operators
let rolfie_base06 = "#e8e8e8" # Light Foreground (Not often used)
let rolfie_base07 = "#f8f8f8" # Light Background (Not often used)

let rolfie_colors = open ~/.config/.rolfie_colors.json

let rolfie_white = ($rolfie_colors | get rolfie_white | get hexa)
let rolfie_white_blue = ($rolfie_colors | get rolfie_white_blue | get hexa)
let rolfie_dark_grey = ($rolfie_colors | get rolfie_dark_grey | get hexa) 
let rolfie_light_grey = ($rolfie_colors | get rolfie_light_grey | get hexa)
let rolfie_dark_green = ($rolfie_colors | get rolfie_dark_green | get hexa)
let rolfie_green = ($rolfie_colors | get rolfie_green | get hexa)
let rolfie_violet = ($rolfie_colors | get rolfie_violet | get hexa)
let rolfie_blue = ($rolfie_colors | get rolfie_blue | get hexa) 
let rolfie_red = ($rolfie_colors | get rolfie_red | get hexa)
let rolfie_bold_red = ($rolfie_colors | get rolfie_bold_red | get hexa)
let rolfie_dark_red = ($rolfie_colors | get rolfie_dark_red | get hexa) 
let rolfie_orange = ($rolfie_colors | get rolfie_orange | get hexa)
