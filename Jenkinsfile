pipeline {
    agent any
    triggers {
      upstream(upstreamProjects: 'TestProject, ArduinoPlugAndPlay', threshold: hudson.model.Result.SUCCESS)
    }
    stages {
        stage('Setup') {
            steps {
                shHide( 'git remote set-url origin https://${GHTOKEN}@github.com/GreenSense/libs.git' )
            }
        }
        stage('Prepare') {
            when { expression { !shouldSkipBuild() } }
            steps {
                sh 'echo "Prepare disabled to speed up tests." # sh prepare.sh'
            }
        }
        stage('Test') {
            when { expression { !shouldSkipBuild() } }
            steps {
                sh 'echo "Hello world"'
            }
        }
        
    }
    post {
        success() {
          emailext (
              subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
              body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>""",
              recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
        failure() {
          sh 'sh rollback.sh'
          emailext (
              subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
              body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>""",
              recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}
Boolean shouldSkipBuild() {
    return sh( script: 'sh check-ci-skip.sh', returnStatus: true )
}
def shHide(cmd) {
    sh('#!/bin/sh -e\n' + cmd)
}
