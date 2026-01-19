### Exercise 2: Add node plugin to Jenkins controller 
###  Prerequisite
A Jenkins controller is running. If not, then go back to unit 02 and see there.
### Tasks
In Jenkins ...
1. Add a node plugin 
2. Set up a pipeline and test it

settings -> plugins -> available -> search for "node" -> install without restart
manage jenkins -> tools -> nodejs -> add nodejs installation -> name: nodejs

IF LIBATOMIC1 ERROR:

```bash
docker exec -it -u root jenkins bin/bash
apt-get update && apt-get install -y libatomic1  # as root inside jenkins container
exit
```

```jenkins
pipeline {
    agent {
        node {
            label 'your-node-label' // Replace with the label of your configured node
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building on a specific node...'
                // Add your build steps here
            }
        }
    }
}
```