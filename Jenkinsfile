import groovy.json.JsonSlurper;
node{
    stage 'Build, Test and Package'
    env.PATH = "/usr/share/maven/bin:${env.PATH}"
    git url: "https://github.com/vaibhav-walke/example-spring-boot.git/"
    // workaround, taken from https://github.com/jenkinsci/pipeline-examples/blob/master/pipeline-examples/gitcommit/gitcommit.groovy
    def commitid = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    def workspacePath = pwd()
    sh "echo ${workspacePath}"
    sh "echo ${commitid} > ${workspacePath}/expectedCommitid.txt"
    //sh "echo ${workspacePath} > ${workspacePath}/expectedCommitid.txt"
    sh "mvn clean package -Dcommitid=${commitid}"
}
node{
    stage 'Stop, Deploy and Start'
    // shutdown
    sh 'curl -X POST http://ip-10-0-0-48:8090/shutdown || true'
    sh 'sleep 50'
    // copy file to target location
    sh 'cp target/*.war /tmp/'
    // start the application
    sh 'java -jar /tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war &'
    sh 'sleep 100'
   // sh "nohup java -jar target/spring-boot-webapp-0.0.1-SNAPSHOT.war &" 
    // wait for application to respond
    //sh 'sleep 50; httping -qc1 http://ip-10-0-0-48:8090'
     sh 'while ! httping -qc1 http://ip-10-0-0-48:8090 ; do sleep 1 ; done'
}
node{
    stage 'Smoketest'
    def workspacePath = pwd()
    sh 'sleep 30 ; curl -s -o /dev/null -w "%{http_code}" http://ip-10-0-0-48:8090/info -o ${workspacePath}/info.json'
    if (deploymentOk()){
        return 0
    } else {
        return 1
    }
} 
def deploymentOk(){
    def workspacePath = pwd()
    expectedCommitid = new File("${workspacePath}/expectedCommitid.txt").text.trim()
    actualCommitid = readCommitidFromJson()
    println "expected commitid from txt: ${expectedCommitid}"
    println "actual commitid from json: ${actualCommitid}"
    return expectedCommitid == actualCommitid
    //println "result:${result}" 
    //if(${result}=="false")
    //{
      // error 'Stage is failed'
    //}
    //return result
}
def readCommitidFromJson() {
    def workspacePath = pwd()
    def slurper = new JsonSlurper()
    def json = slurper.parseText(new File("${workspacePath}/info.json").text)
    def commitid = json.app.commitid
    return commitid
}
