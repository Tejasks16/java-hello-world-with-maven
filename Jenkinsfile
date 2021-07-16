pipeline{
  agent any
  stages{
    stage('build'){
      steps{
          sh 'cd /home/slave5/workspace/finalproj'
          sh 'docker build -t "maven" .'
        }
    }
}
}
