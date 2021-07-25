def tagname="1.0.0"
pipeline{
  agent none
  stages{
    stage('build'){
      agent {
        label 'javamaven'
      }
      steps{
          sh 'cd /home/slave5/workspace/finalproj'
          version_tag = sh (returnStdout: true, script: 'git branch | awk -F \')\' \'{print $1}\' | awk -F \' \' \'{print $NF}\' | head -1 ').trim() 
          sh 'docker build -t maven:$tagname .'
        }
    }
    stage('publish'){
      agent {
        label 'javamaven'
      }
      steps{
           sh 'docker tag maven:latest 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'
           sh 'docker push 158158759913.dkr.ecr.ap-south-1.amazonaws.com/projbuilt:finalbuild'       
        }
    }
    stage('deploy'){
      agent{
      }
      steps{
        sh 'helm upgrade devtest (tarfile from repo) --set version_tag=$tagname'
      }
    }
    
}
}
