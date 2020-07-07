#!/bin/bash
KEIJI_PID=`docker ps -a | grep keijibanphpdocker_app | cut -d" " -f1`
MYSQL_PID=`docker ps -a | grep mysql | cut -d" " -f1`
GIP='【IPアドレス】'

docker start ${MYSQL_PID}
sleep 5
docker exec -it ${MYSQL_PID} sh -c "/bin/bash /docker-entrypoint-initdb.d/init-database.sh"

sed -i -e "s/【MySQLコンテナID】/${MYSQL_PID}/" ./php/index.php
sed -i -e "s/【MySQLコンテナID】/${MYSQL_PID}/" ./php/article.php
sed -i -e "s/【WEBサーバIP】/${GIP}/" ./php/index.php
sed -i -e "s/【WEBサーバIP】/${GIP}/" ./php/article.php

docker cp php/article.php ${KEIJI_PID}:/var/www/html/
docker cp php/index.php ${KEIJI_PID}:/var/www/html/
