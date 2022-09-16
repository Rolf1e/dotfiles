# Content Square

module content_square {

  export def ,aws_login [] {
    csq okta set-aws-creds -p $"(pass show okta)" 
  }

}

