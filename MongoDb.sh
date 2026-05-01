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

dnf install -y mongodb-org &>>/tmp/mongodb.log
if [ $? -ne 0 ]; then
  echo -e "${R}Failed to install MongoDB. Check /tmp/mongodb.log for details.${N}"
  exit 1
else
  echo -e "${G}MongoDB installed successfully.${N}"
fi

