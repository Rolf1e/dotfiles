export ARTIFACTORY_USR=tigran.slama
export ARTIFACTORY_PSW=$(pass show api_key_artifactory)

alias :q='exit'

eval "$(ssh-agent -s)"
