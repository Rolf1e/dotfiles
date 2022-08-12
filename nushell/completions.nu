
module completion {

  def make_completion [] {
    ^make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'| lines 
  }

  export extern "make" [
    task?: string@make_completion
  ]
}

use completion *


