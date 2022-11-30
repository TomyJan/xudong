#!/bin/sh
if [ "$1"x == dev* -o "$1"x == "x" ]
then
    if [ "$1"x == "x" ]
    then
        echo "未输入要部署的配置名 ./ready_deploy.sh <region_name>"
        exit 0
    fi
fi

local_ip=$(ifconfig | grep inet | grep -v inet6 | grep -v 127 | sed 's/^[ \t]*//g' | cut -d ' ' -f2)

python ready_deploy_dev.py $1 $local_ip
