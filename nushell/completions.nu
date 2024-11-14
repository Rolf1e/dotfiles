module pass_completions {

  export def pass_completion [] {
    let home_pwd = "~/.password-store/"
    let gpg = '.gpg'
    let gpg_length = ($gpg | str length)
    tree -f -i $home_pwd
    | lines
    | each { |line| $line | str substring  $"($home_pwd | str length)," }
    | where ($it | str length) > 0
    | each {|$it| 
        if ($it | str ends-with $gpg) { 
            $it | str substring $"0,(($it| str length) - $gpg_length)"
        } else { 
            $it
        }
      }
    }

  export extern "pass" [ 
    show?: string@pass_completion
    insert?: string
    generate?: string
    --clip(-c): 
  ]

}

module make_completions {

  def make_completion [] {
    ^make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'| lines 
  }

  export extern "make" [
    task?: string@make_completion
  ]
}

use make_completions *
use pass_completions *


