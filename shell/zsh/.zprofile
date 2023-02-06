eval "$(/opt/homebrew/bin/brew shellenv)"
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# >>> JVM installed by coursier >>>
# export JAVA_HOME="/Users/tigranslama/Library/Caches/Coursier/arc/https/github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jdk_x64_mac_hotspot_8u292b10.tar.gz/jdk8u292-b10/Contents/Home"
# <<< JVM installed by coursier <<<

export JAVA_HOME="/Users/tigranslama/Library/Java/JavaVirtualMachines/openjdk-18.0.2.1/Contents/Home"


# >>> coursier install directory >>>
export PATH="$PATH:/Users/tigranslama/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# Content Square
PATH="/Users/tigranslama/projects/platform_csq:$PATH"
PATH="$SCALA_HOME:$PATH"

