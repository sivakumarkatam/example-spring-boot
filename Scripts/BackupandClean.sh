 #!/bin/sh

cd /home/ubuntu/
if [ ! -d "/home/ubuntu/backup" ]; then
  mkdir backup
fi
cd /home/ubuntu/backup/
mkdir "$(date '+%A-%d''-''%b-%Y')"
cd "$(date '+%A-%d''-''%b-%Y')"
mv /home/ubuntu/spring-boot-webapp-0.0.1-SNAPSHOT.war .
rm -rf /home/ubuntu/spring-boot-webapp-0.0.1-SNAPSHOT.war
rm -rf /home/ubuntu/appspec.yml
