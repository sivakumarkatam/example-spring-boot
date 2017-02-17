node{
    // Mark the code checkout 'stage'....
    stage 'Checkout'
    echo 'Hello Jenkins'
    // Get some code from a GitHub repository
    git url: 'https://github.com/vaibhav-walke/example-spring-boot.git/'

    // Mark the code build
    stage 'Build'

    maven() {
        
        // Run the maven build
        sh "mvn clean install"
        sh "mvn package"
         def artifactory = Artifactory.server('my.server.id')
  def mavenBuild = Artifactory.newMavenBuild()
  mavenBuild.deployer server: artifactory, releaseRepo: 'mystuff-local', snapshotRepo: 'mystuff-snapshots-local'
  mavenBuild.tool = 'Maven 3.3.9'

  def coreBuildInfo = mavenBuild.run pom: 'cm\\settings.xml', goals: 'clean install', opts: '-Dmaven.repo.local=.repository -Dmaven.test.failure.ignore -B -U -Prelease'
         
    }
    echo 'Hello Jenkins'
}

