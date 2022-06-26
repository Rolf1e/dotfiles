let base00 = "#181818" # Default Background
let base01 = "#282828" # Lighter Background (Used for status bars, line number and folding marks)
let base02 = "#383838" # Selection Background
let base04 = "#b8b8b8" # Dark Foreground (Used for status bars)
let base05 = "#d8d8d8" # Default Foreground, Caret, Delimiters, Operators
let base06 = "#e8e8e8" # Light Foreground (Not often used)
let base07 = "#f8f8f8" # Light Background (Not often used)

let white = "#fbf1c7"
let white_blue = "#a9b7c6"
let dark_grey = "#2b2b2b"
let light_grey = "#928374"
let dark_green = "#6a8759"
let green = "#a9b665"
let violet = "#d3869b"
let blue = "#7daea3"
let red = "#ea6962"
let bold_red = "#ff0000"
let dark_red = "#cc241d"
let orange = "#fe8019"

let rolfie_theme = {
    separator: $white
    leading_trailing_space_bg: $base04
    header: $orange
    date: $red
    filesize: $violet
    row_index: $light_grey
    bool: $violet
    int: $violet
    duration: $violet
    range: $violet
    float: $violet
    string: $dark_green
    nothing: $white
    binary: $violet
    cellpath: $light_grey
    hints: dark_gray

    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_bool: $red
    shape_int: { fg: $violet attr: b}
    shape_float: { fg: $violet attr: b}
    shape_range: { fg: $violet attr: b}
    shape_internalcall: { fg: $violet attr: b}
    shape_external: $orange
    shape_externalarg: { fg: $dark_green attr: b}
    shape_literal: $green
    shape_operator: $white
    shape_signature: { fg: $dark_green attr: b}
    shape_string: $dark_green
    shape_filepath: $green
    shape_globpattern: { fg: $green attr: b}
    shape_variable: $red
    shape_flag: { fg: $green attr: b}
    shape_custom: {attr: b}
}

let-env config = {
  table_mode: light 
  use_ls_colors: true
  color_config: $rolfie_theme 
  use_grid_icons: true
  use_ansi_coloring: true
}
