source ~/.config/nushell/colors.nu

let rolfie_theme = {
    separator: $rolfie_white
    leading_trailing_space_bg: $rolfie_base04
    header: $rolfie_orange
    date: $rolfie_red
    filesize: $rolfie_violet
    row_index: $rolfie_light_grey
    bool: $rolfie_violet
    int: $rolfie_violet
    duration: $rolfie_violet
    range: $rolfie_violet
    float: $rolfie_violet
    string: $rolfie_dark_green
    nothing: $rolfie_white
    binary: $rolfie_violet
    cellpath: $rolfie_light_grey
    hints: dark_gray

    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_bool: $rolfie_red
    shape_int: { fg: $rolfie_violet attr: b}
    shape_float: { fg: $rolfie_violet attr: b}
    shape_range: { fg: $rolfie_violet attr: b}
    shape_internalcall: { fg: $rolfie_violet attr: b}
    shape_external: $rolfie_orange
    shape_externalarg: { fg: $rolfie_dark_green attr: b}
    shape_literal: $rolfie_green
    shape_operator: $rolfie_white
    shape_signature: { fg: $rolfie_dark_green attr: b}
    shape_string: $rolfie_dark_green
    shape_filepath: $rolfie_green
    shape_globpattern: { fg: $rolfie_green attr: b}
    shape_variable: $rolfie_red
    shape_flag: { fg: $rolfie_green attr: b}
    shape_custom: {attr: b}
}

let-env config = {
  table_mode: light 
  use_ls_colors: true
  color_config: $rolfie_theme 
  use_grid_icons: true
  use_ansi_coloring: true
}
