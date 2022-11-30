#!/bin/bash

su - work <<'EOF'

anynowtime="date +'%Y-%m-%d %H:%M:%S'"
NOW="echo [\`$anynowtime\`][PID:$$]"

##### 可在脚本开始运行时调用，打印当时的时间戳及PID。
function job_start
{
    echo "`eval $NOW` job_start"
}

##### 可在脚本执行成功的逻辑分支处调用，打印当时的时间戳及PID。 
function job_success
{
    MSG="$*"
    echo "`eval $NOW` job_success:[$MSG]"
    exit 0
}

##### 可在脚本执行失败的逻辑分支处调用，打印当时的时间戳及PID。
function job_fail
{
    MSG="$*"
    echo "`eval $NOW` job_fail:[$MSG]"
    exit 1
}

job_start

# 为0脚本运行状态为手工运行, 为1在opsmind上运行
RUN_ON_OPSMIND=1

if [ $RUN_ON_OPSMIND -eq 0 ];then
    # 手工运行
    if [ $# -lt 2 ]; then
        job_fail 'USAGE REGION_NAME PROGRAM_BR TIME'
    fi
    
    REGION_NAME="$1"
    PROGRAM_BR="$2"
    TIME=`date '+%Y-%m%d-%H%M'`
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    REGION_NAME={var:__START__.output.region}
    PROGRAM_BR={var:__START__.output.program_br}
    TIME={var:获取配置的时间变量.output.time}
fi

if [ -z "${REGION_NAME}" ];then
	job_fail "REGION_NAME变量不能为空"
fi

REGION_BUILD_PATH=/tmp/new_region/${REGION_NAME}


mkdir -p ${REGION_BUILD_PATH}
cd ${REGION_BUILD_PATH} || exit
rm -rf op_tools
rm -rf config
rm -rf init.sql
svn export http://116.228.211.91:7777/svn/miHoYo/rdTeam/serverCode/app/hk4e/${PROGRAM_BR}/tools/op_tools
cd ${REGION_BUILD_PATH}/op_tools|| job_fail "切换目录失败#1"
echo -e "Y\n"|${REGION_BUILD_PATH}/op_tools/bin/build_conf.py ${REGION_NAME} ./config || job_fail "build conf失败"


OSS_PATH="oss://hk4e-config/${REGION_NAME}/$TIME/"

#上传目录到oss
cp ${REGION_BUILD_PATH}/op_tools/bin/run ./config || job_fail "copy run到配置目录失败"
cd config || job_fail "切换目录失败#2"
tar zcf ${REGION_BUILD_PATH}/op_tools/config-$TIME.tgz *
cd .. || job_fail "切换目录失败#3"
ossutil cp -f config-$TIME.tgz $OSS_PATH || exit 1


EOF