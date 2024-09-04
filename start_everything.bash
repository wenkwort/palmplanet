#!/bin/bash

# launch from this directory
# !!! only if docker-compose is running
#
# launches docker-compose and fixes the routing on server and client

NAME="PALMPLANET"
BPurple='\033[1;35m'
Color_Off='\033[0m'

function palmplanetlogprint {
	printf "$BPurple[ $NAME ]: $1$Color_Off\n"
}

docker-compose up -d
docker exec task_svyatoslav_serverside_1 route del default \
&& docker exec task_svyatoslav_serverside_1 route add default gw 10.1.0.3 dev eth0 \
&& palmplanetlogprint "Server's routes are fixed..."
docker exec task_svyatoslav_clientside_1 route del default \
&& docker exec task_svyatoslav_clientside_1 route add default gw 10.2.0.3 dev eth0
palmplanetlogprint "Client's routes are fixed..."

docker cp ./dnsmasq.hosts task_svyatoslav_dnsserver_1:/etc \
	&& palmplanetlogprint "/etc/dnsmasq.hosts is created..."
docker cp ./dnsmasq.resolv task_svyatoslav_dnsserver_1:/etc \
       	&& palmplanetlogprint "/etc/dnsmasq.resolv is created..."
docker exec task_svyatoslav_dnsserver_1 mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig \
       	&& palmplanetlogprint "Original /etc/dnsmasq.conf is backuped..."
docker cp ./ddocs.txt task_svyatoslav_dnsserver_1:/etc/dnsmasq.conf \
	&& palmplanetlogprint "/etc/dnsmasq.conf is created..."

# docker exec task_svyatoslav_dnsserver_1 mkdir /var/log/dnsmasq \
# && docker exec task_svyatoslav_dnsserver_1 touch /var/log/dnsmasq/dnsmasq.log \
# palmplanetlogprint "dnsmasq's log file is created..."
