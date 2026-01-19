### Exercise 4: Development-cycle pipeline  
###  Prerequisite
1. A Jenkins controller is running.
2. Previous exercise has been implemented successfully.

### Tasks
In Jenkins extend the checkout pipeline of the previous exercise ...
1. by adding a stage for installing all required dependencies and tools.
2. by adding a stage for testing the app1.
3. Build and check the new pipeline.

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