#!/bin/sh

#
#    常量定义
#

# 全量的模块列表
FULL_MODULE_LIST="gateserver gameserver nodeserver dbgate dispatch muipserver multiserver oaserver"

# 本地发布时的默认工作目录
LOCAL_WORK_DIR="../"

#
#    带颜色的echo
#
function deep_green_echo()
{
    local what=$*
    echo -e "\033[36m ${what} \033[0m"
}

function yello_echo()
{
    local what=$*
    echo -e "\033[33m ${what} \033[0m"
}

function red_echo()
{
    local what=$*
    echo -e "\033[31m ${what} \033[0m"
}

function deepGreenEcho()
{
    local what=$*
    echo -e "\033[36m ${what} \033[0m"
}

function yelloEcho()
{
    local what=$*
    echo -e "\033[33m ${what} \033[0m"
}

function redEcho()
{
    local what=$*
    echo -e "\033[31m ${what} \033[0m"
}

function deepGreenEchoTimeFormat()
{
    local what=$*
    echo -e "\033[36m ====== `date +%H:%M:%S`: ${what} ======\033[0m"
}
