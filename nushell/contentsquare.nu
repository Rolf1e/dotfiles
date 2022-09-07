
let-env TMUX_WORKFLOW = 'content-square'

# Content Square
let-env ARTIFACTORY_USR = 'tigran.slama'
let-env ARTIFACTORY_PSW = $"(pass show api_key_artifactory)"
let-env AWS_PROFILE = 'default'
let-env AWS_REGION = 'eu-west-1'

def aws_login [mfa] {
  csq ol login --password $"(pass onelogin)" --mfa-code $mfa
}
