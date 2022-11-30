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
    if [ $# -lt 2 ]; then
        job_fail 'USAGE PROCESS_LIST VERSION'
    fi
    
	PROCESS_LIST=$1
	VERSION=$2
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    PROCESS_LIST={var:xxx}
    VERSION={var:xxx}
fi



GAME_DIR="/home/data/hk4e"
COMPONENT_NAME="program"
UPDATE_ROOT_DIR="/home/data/version_update"
CURRENT_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}/${VERSION}

LOG_FILE="/tmp/hk4e.program.log."`date '+%s'`

#参数验证

if [ -d $CURRENT_DIR ];then
        echo "[Update Config] ==>  ${PROCESS} ...."
else
        echo -e '\e[31m [ERROR] 未找到更新版本  \e[m'
        exit 1
fi

#更新配置
# PROCESS EXAMPLE gameserver_2009.2.1.1

for PROCESS_PID in $PROCESS_LIST; do
    process=`echo $PROCESS_PID | cut -d "_" -f 1`
    pid=`echo $PROCESS_PID | cut -d "_" -f 2`
    if [ -L ${GAME_DIR}/${PROCESS_PID}/${process} ];then
        rm -f ${GAME_DIR}/${PROCESS_PID}/${process}
    else
        rm -rf ${GAME_DIR}/${PROCESS_PID}/${process}
    fi
	
    ln -snf ${CURRENT_DIR}/hk4e_output/${process}/${process} ${GAME_DIR}/${PROCESS_PID}/${process}
	ln -snf ${CURRENT_DIR}/hk4e_output/lib ${GAME_DIR}/${PROCESS_PID}/lib
done

#check update
for PROCESS_PID in $PROCESS_LIST;do
    process=`echo $PROCESS_PID | cut -d "_" -f 1`
    pid=`echo $PROCESS_PID | cut -d "_" -f 2`

	cd ${GAME_DIR}/${PROCESS_PID}
	code_version=`./${process} -v | grep code_version |awk  '{print $2}'`
	if [ "$code_version" == "$VERSION" ]; then
		echo "${PROCESS_PID} success [$code_version]" >> $LOG_FILE
		# 删除patch
		[ -d ${GAME_DIR}/${PROCESS_PID}/patch ] && rm -r ${GAME_DIR}/${PROCESS_PID}/patch
	else
		echo "${PROCESS_PID} ERROR [$code_version]" >>$Check_log
	fi
done

#return
flag=`grep "ERROR" $LOG_FILE | wc -l`
if [ $flag -lt 0 ];then
        echo "[ERROR] update conf"
        cat $LOG_FILE
        job_fail '更新配置文件失败'
else
        echo "[SUCCESS] update conf"
        cat $LOG_FILE
fi