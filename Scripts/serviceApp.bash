#!/bin/bash

cp -f /var/lib/jenkins/workspace/java/target/spring-boot-webapp-0.0.1-SNAPSHOT.war /tmp/
cp -f /tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war /var/tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war

sudo ln -fs /var/tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war /etc/init.d/spring-boot-new
