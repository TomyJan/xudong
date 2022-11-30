#!/bin/bash

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
RUN_ON_OPSMIND=0

if [ $RUN_ON_OPSMIND -eq 0 ];then
    # 手工运行
    if [ $# -lt 3 ]; then
        job_fail 'USAGE REGION_NAME PROGRAM_BR TIME'
    fi
    
    REGION_NAME="$1"
    PROGRAM_BR="$2"
    TIME="$3"
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    REGION_NAME={var:xxx}
    PROGRAM_BR={var:xxx}
    TIME={var:xxx}
fi

#更新组件的名成(config为配置, program为程序, data为数值)
COMPONENT_NAME="config"
####################
UPDATE_ROOT_DIR="/home/data/version_update"
FILENAME="${COMPONENT_NAME}-$TIME.tgz"
COMPONENT_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}
DEST_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}/${TIME}


#创建目录
[ -d $DEST_DIR ] || mkdir -p $DEST_DIR

#delete old version
function del_old {
        echo -e "\e[36m delete old version \e[m"
        target_list=`ls -t ${COMPONENT_DIR} | awk '{if(NR>10){print \$1}}'`
        for item in  $target_list; do
                rm -rf ${COMPONENT_DIR}/$item
        done
}


#下载配置文件
function get_config {
    OSSUTIL_URL=oss://hk4e-config/${REGION_NAME}/${TIME}/${FILENAME}
    ossutil cp -f $OSSUTIL_URL ${DEST_DIR} || job_fail "下载配置文件失败"
	tar xf ${DEST_DIR}/${FILENAME} -C ${DEST_DIR} || job_fail "解压配置文件失败"
    if [ -f ${DEST_DIR}/${FILENAME} ];then
        ln -snf ${DEST_DIR} ${DEST_DIR}/../current
        del_old
        echo -e "[OK] 下载完成"
    else
        echo -e '\e[31m 未找到配置文件 \e[m'
        exit 1
    fi
}

get_config