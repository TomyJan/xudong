#!/bin/bash

export PATH=$PATH:/usr/local/bin
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

function process_start
{
    cd ${GAME_DIR} || job_fail "进入游戏目录失败"
    PROCESS_PID="$1"
	
	nohup supervise ${GAME_DIR}/${PROCESS_PID} > /dev/null 2>&1  &
	sleep 2s
	[ -d $GAME_DIR/${PROCESS_PID}/supervise ] && chmod 777 -R ${GAME_DIR}/${PROCESS_PID}/supervise	
	
	# 状态检查, 判断是否启动
	cd ${PROCESS_PID}
	ret=$(svstat . 2>&1)
	echo $ret | egrep -E 'up .* seconds$' || job_fail "启动${PROCESS_PID}进程失败"
	
	# 判断启动时间是否超过20秒
	TIMEOUT=50
	TIMEOUT_RECORD=${TIMEOUT}
	isOK=false
	while [ ${TIMEOUT} -gt 0 ];
	do 
		echo "Wait for $PROCESS_PID starting > 20s"
		sleep 1
		svstat .|egrep -E "up .* [2-9][0-9]+ seconds$" && isOK=true
		if [ $isOK == true ]; then break; fi
		let TIMEOUT-=1
	done;
	# 判断停止结果
	if [ $isOK == true ]; then
		echo "$PROCESS_PID started"
		return 1
	else
		job_fail "经过${TIMEOUT_RECORD}秒后, 停止${PROCESS_PID} 仍失败"
	fi            	
	
}

job_start

# 为0脚本运行状态为手工运行, 为1在opsmind上运行
RUN_ON_OPSMIND=0

if [ $RUN_ON_OPSMIND -eq 0 ];then
    # 手工运行
    if [ $# -lt 1 ]; then
        job_fail 'USAGE PROCESS_LIST'
    fi
    
	PROCESS_LIST=$1
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    PROCESS_LIST={var:xxx}
fi



GAME_DIR="/home/data/hk4e"


LOG_FILE="/tmp/hk4e.conf.log."`date '+%s'`


#更新配置
# PROCESS EXAMPLE gameserver_2009.2.1.1

for PROCESS_PID in $PROCESS_LIST; do
    process=`echo $PROCESS_PID | cut -d "_" -f 1`
    pid=`echo $PROCESS_PID | cut -d "_" -f 2`
	echo "Starting $process [$pid]"
	cd ${GAME_DIR} || job_fail "进入游戏目录失败#2" 
	process_start $PROCESS_PID
done