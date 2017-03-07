 #!/bin/sh

cd /home/ec2-user/
if [ ! -d "/home/ec2-user/backup" ]; then
  mkdir backup
fi
cd /home/ec2-user/backup/
mkdir "$(date '+%A-%d''-''%b-%Y')"
cd "$(date '+%A-%d''-''%b-%Y')"
mv /home/ec2-user/gs-spring-boot-0.1.0.jar .
rm -rf /home/ec2-user/gs-spring-boot-0.1.0.jar
rm -rf /home/ec2-user/appspec.yml
