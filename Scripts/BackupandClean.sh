 #!/bin/sh

cd /home/ec2-user/
if [ ! -d "/home/ec2-user/backup" ]; then
  mkdir backup
fi
cd /home/ec2-user/backup/
mkdir "$(date '+%A-%d''-''%b-%Y')"
cd "$(date '+%A-%d''-''%b-%Y')"
mv /home/ec2-user/spring-boot-webapp-0.0.1-SNAPSHOT.war .
rm -rf /home/ec2-user/spring-boot-webapp-0.0.1-SNAPSHOT.war
rm -rf /home/ec2-user/appspec.yml
