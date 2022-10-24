

# Get logs from given pod
def pod_log [name: string] {
  kubectl logs $name
}

# Describe current pods in the selected namespace
# Connect to namespace if given
def pod_describe [namespace?: string] {
  if (null != $namespace) {
    kubens $namespace
  }
  kubectl get pods -o wide
}

def pod_describe_config [name: string] {
  kubectl describe configMaps $name
}

def-env dev_cs [dir?: string] { 
  cd $"/Users/tigranslama/projects/cs/($dir)"
}
