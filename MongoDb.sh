!#/bin/bash

UserId=$(id -u)
R="\e[031m"
G="\e[032m"
Y="\e[033m"
N="\e[0m"
if [ $UserId -ne 0 ]; then
  echo "You should run this script as root user or with sudo privileges"
  exit 1
fi
echo -e "${G}Script is running with root user privileges: $(date)${N}"
 
 cp mongo.repo /etc/yum.repos.d/mongo.repo
if [ $? -ne 0 ]; then
  echo -e "${R}Failed to add MongoDB repository. Check the mongo.repo file and try again.${N}"
  exit 1
else
  echo -e "${G}MongoDB repository added successfully.${N}"
fi

dnf install -y mongodb-org &>>/tmp/mongodb.log
if [ $? -ne 0 ]; then
  echo -e "${R}Failed to install MongoDB. Check /tmp/mongodb.log for details.${N}"
  exit 1
else
  echo -e "${G}MongoDB installed successfully.${N}"
fi

