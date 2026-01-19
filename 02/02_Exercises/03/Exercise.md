### Exercise 3: Setup a checkout pipeline 
###  Prerequisite
1. A Jenkins controller is running. If not, then go back to unit 02 and see there.
2. Previous exercise has been implemented successfully
### Tasks
In Jenkins ...
1. Create a public repo on GitHub and push the content (source files) of traffic-light app. Ignore node_modules and *-lock.json files.
2. Set up a pipeline with git and test it

```jenkins
pipeline {
    agent any
    tools {nodejs 'node'}
    stages {
        stage('Checkout') {
            steps {
                // Replace the URL with your GitHub repository URL
                git branch: 'main', url: 'https://github.com/varelam-bzz/traffic-light.git'
            }
        }

        stage('Install jest-cli') {
            steps {
                // Install jest-cli globally
                sh 'npm install -g jest-cli'
            }
        }
        
        stage('Install dependencies') {
            steps {
                // Install project dependencies
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }
    }
}
```