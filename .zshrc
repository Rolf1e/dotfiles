export ARTIFACTORY_USR=tigran.slama
export ARTIFACTORY_PSW=$(pass show api_key_artifactory)
export AWS_PROFILE=default
export AWS_REGION=eu-west-1

alias :q='exit'

aws_login () {
	mfa_code = $1
	csq okta set-aws-creds -p $(pass show okta)
}

eval "$(ssh-agent -s)"
