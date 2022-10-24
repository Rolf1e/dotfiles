module scala_sbt {

  export def scala_new_sbt_project [name, scala_version = "3.2.0", sbt_version = "1.7.1"] {
    mkdir $name
    cd $name
    ^mkdir -p src/main/scala
    ^mkdir -p src/test/scala
    mkdir project target
    setup_sbt_properties $sbt_version $scala_version 
  }

  def setup_sbt_properties [sbt_version, scala_version] {
    echo $"sbt.version=($sbt_version)" | save project/build.properties
    echo $"scalaVersion := \"($scala_version)\"" | save build.sbt
  }

}

use scala_sbt *

