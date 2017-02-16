node{
    // Mark the code checkout 'stage'....
    stage 'Checkout'
    echo 'Hello Jenkins'
    // Get some code from a GitHub repository
    git url: 'https://github.com/vaibhav-walke/example-spring-boot.git/'

    // Mark the code build
    stage 'Build'

    withMaven(
            maven: 'M3',
            mavenSettingsConfig: 'maven-settings-for-gameoflife',
            mavenLocalRepo: '.repository') {

        // Run the maven build
        sh "mvn clean install"
    }
}

