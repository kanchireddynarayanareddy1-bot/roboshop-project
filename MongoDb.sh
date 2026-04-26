!#/bin/bash

UserId=$(id -u)
if [ $ $userId -ne 0 ]; then
  echo "You should run this script as root user or with sudo privileges"
  exit 1
fi
echo "sccript is running with root user privileges: $(time)"