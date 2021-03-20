M2="$HOME/.m2/"
LOMBOK="$M2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"
JAR="$HOME/software/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar"
GRADLE_HOME=$HOME/gradle /usr/lib/jvm/java-11-openjdk-amd64/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -javaagent:$LOMBOK \
  -jar $(echo "$JAR") \
  -configuration "$HOME/software/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux" \
  -data "${1:-$HOME/workspace}" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
