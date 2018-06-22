#!/bin/bash

function log ()
{
	if [ ! -f /var/log/codoon/shell.log ]
	then
		mkdir -p /var/log/go/
		touch /var/log/go/shell.log
	fi
	DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
	USER_N=`whoami`
	echo "${DATE_N} ${USER_N} execute $0 [INFO] $@" >>/var/log/go/shell.log #执行成功日志打印路径
}

git pull
swag init
go install
supervisorctl restart sport_coin
log "build end"