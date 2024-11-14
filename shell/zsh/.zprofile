eval "$(/opt/homebrew/bin/brew shellenv)"
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export JAVA_HOME="/Users/tigranslama/Library/Java/JavaVirtualMachines/openjdk-18.0.2.1/Contents/Home"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/tigranslama/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# Content Square
PATH="/Users/tigranslama/projects/platform_csq:$PATH"
PATH="$SCALA_HOME:$PATH"

export FLINK_HOME=$HOME/frameworks/flink/flink-1.10.3

export GO_PATH="$HOME/go"
export PATH="$PATH:$GO_PATH/bin"
export PATH="$PATH:$FLINK_HOME/bin:$HOME/.pub-cache/bin"

# eval $(fzf --zsh)
