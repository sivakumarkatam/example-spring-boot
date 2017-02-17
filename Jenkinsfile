import groovy.json.JsonSlurper;
 
node{
    stage 'Build, Test and Package'
    env.PATH = "/usr/share/maven/bin:${env.PATH}"
    git url: "https://github.com/vaibhav-walke/example-spring-boot.git/"
    def commitid = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    def workspacePath = pwd()
    sh "echo ${commitid} > ${workspacePath}/expectedCommitid.txt"
    sh "mvn clean package -Dcommitid=${commitid}"
    sh "java -jar spring-boot-webapp-0.0.1-SNAPSHOT.war"
}

