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

function process_stop
{
    cd ${GAME_DIR} || job_fail "进入游戏目录失败"
    PROCESS_PID="$1"
	if [ -f "${PROCESS_PID}/supervise/status" ]; then
		cd ${PROCESS_PID}
		
		# 服务在启动, 先svc -d 再关闭supervise
		# 判断服务没有启动, 停止supervise
		# 判断supervise没有启动, 直接退出
		
		svstat . | grep "supervise not running" &> /dev/null
		if [ $? -eq 0 ];then 
			echo "进程${PROCESS_PID}没有运行, 跳过..."
			return 0
		fi
		
                # 包含up (pid 6031) 51 seconds, want down | up (pid 6031) 51 seconds 两种情况
		svstat . | egrep -E "up.*seconds" &> /dev/null
		if [ $? -eq 0 ]; then
			echo "向${PROCESS_PID}发送svc -d ."
			[ -f "/usr/local/bin/svc" ] || job_fail "向${PROCESS_PID}发送svc -d .失败, 没有安装svc命令"
			ret=$(svc -d . 2>&1)		

			echo $ret | grep "unable to control" && job_fail "停止${PROCESS_PID}进程失败"
			TIMEOUT=100
			TIMEOUT_RECORD=${TIMEOUT}
			isOK=false
			while [ ${TIMEOUT} -gt 0 ];
			do 
				echo "$PROCESS_PID stopping"
				sleep 1
				svstat .|egrep -E "down [0-9]+ seconds, normally up$" && isOK=true
				if [ $isOK == true ]; then break; fi
				let TIMEOUT-=1
			done;
			# 判断停止结果
			if [ $isOK == true ]; then
				echo "$PROCESS_PID stopped"
				/usr/local/bin/svc -x . 2>&1
				svstat . | grep "supervise not running" || job_fail "停止${PROCESS_PID}supervise守护进程失败"
				return 1
			else
				job_fail "经过${TIMEOUT_RECORD}秒后, 停止${PROCESS_PID} 仍失败"
			fi            
		fi
		
		svstat . |egrep -E "down [0-9]+ seconds, normally up$"
		if [ $? -eq 0 ]; then
			ret=$(svc -x . 2>&1)
			echo $ret
			svstat . | grep "supervise not running" && return 0
		fi
		return 1
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
	echo "Shutdown $process [$pid]"
	cd ${GAME_DIR} || job_fail "进入游戏目录失败#2" 
	process_stop $PROCESS_PID
done