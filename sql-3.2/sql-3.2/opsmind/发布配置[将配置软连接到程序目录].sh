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
        job_fail 'USAGE PROCESS_LIST TIME'
    fi
    
	PROCESS_LIST=$1
	TIME=$2
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    PROCESS_LIST={var:xxx}
    TIME={var:xxx}
fi



GAME_DIR="/home/data/hk4e"
COMPONENT_NAME="config"
UPDATE_ROOT_DIR="/home/data/version_update"
CURRENT_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}/${TIME}

LOG_FILE="/tmp/hk4e.conf.log."`date '+%s'`

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
    if [ -L ${GAME_DIR}/${PROCESS_PID}/conf ];then
        rm -f ${GAME_DIR}/${PROCESS_PID}/conf
    else
        rm -rf ${GAME_DIR}/${PROCESS_PID}/conf
    fi
    ln -snf ${CURRENT_DIR}/${process}/conf ${GAME_DIR}/${PROCESS_PID}/conf
    cp -f ${CURRENT_DIR}/run ${GAME_DIR}/${PROCESS_PID}
done

#check update
echo "" > $LOG_FILE
for PROCESS_PID in $PROCESS_LIST;do
    process=`echo $PROCESS_PID | cut -d "_" -f 1`
    pid=`echo $PROCESS_PID | cut -d "_" -f 2`
    Smd5=`md5sum ${CURRENT_DIR}/${process}/conf/${process}.xml | awk '{print $1}'`
    Tmd5=`md5sum ${GAME_DIR}/${PROCESS_PID}/conf/${process}.xml | awk '{print $1}'`
	if [ "$Smd5" == "$Tmd5" ]; then
		echo "${PROCESS_PID} SUCCESS" >> $LOG_FILE
	else
		echo "${PROCESS_PID} ERROR" >>$LOG_FILE
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