pipeline{
  agent none
  stages{
    stage('build'){
      agent {
        label 'javamaven'
      }
      steps{
          sh 'cd /home/slave5/workspace/finalproj'
          sh 'docker build -t "maven" .'
        }
    }
    stage('deploy'){
      agent {
        label 'dockpat'
      }
      steps{
//           sh 'docker tag maven:latest 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'
//           sh 'docker push 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'
          sh 'docker pull 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'
          sh 'docker run -dt -p 8095:8080 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'
        }
    }
}
}
