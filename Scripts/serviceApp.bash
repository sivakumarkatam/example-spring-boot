#!/bin/bash

cp -f /tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war /var/tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war

sudo ln -fs /var/tmp/spring-boot-webapp-0.0.1-SNAPSHOT.war /etc/init.d/spring-boot-new
