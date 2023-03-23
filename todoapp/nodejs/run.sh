#!/bin/bash

source /opt/rh/nodejs010/enable

podman run -d --name mysql -e MYSQL_DATABASE=items -e MYSQL_USER=user1 \
-e MYSQL_PASSWORD=mypa55 -e MYSQL_ROOT_PASSWORD=r00tpa55 \
-v $PWD/work/data:/var/lib/mysql/data \
-p 30306:3306 \
registry.redhat.io/rhel8/mysql-80:1

podman run -d --name todoapi -e MYSQL_DATABASE=items -e MYSQL_USER=user1 \
-e MYSQL_PASSWORD=mypa55 \
-p 30080:30080 \
do180/todonodejs

node app.js
