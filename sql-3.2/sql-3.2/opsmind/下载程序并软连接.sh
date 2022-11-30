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
        job_fail 'USAGE PROGRAM_BR VERSION'
    fi
    
    # REGION_NAME="$1"
    PROGRAM_BR="$1"
    VERSION="$2"
    ####
elif [ $RUN_ON_OPSMIND -eq 1 ];then
    # 在上opsmind运行时加载的变量
    # REGION_NAME={var:xxx}
    PROGRAM_BR={var:xxx}
    VERSION={var:xxx}
fi

#更新组件的名成(config为配置, program为程序, data为数值)
COMPONENT_NAME="program"
####################
UPDATE_ROOT_DIR="/home/data/version_update"
FILENAME="hk4e_output.tar.gz"
FILENAME_MD5="hk4e_output.tar.gz.md5"
COMPONENT_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}
DEST_DIR=${UPDATE_ROOT_DIR}/${COMPONENT_NAME}/${VERSION}


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


#下载文件
function get_code {
    OSSUTIL_BIN_URL=oss://hk4e-trans/server_bin/hk4e_${PROGRAM_BR}/${FILENAME}.$VERSION
	OSSUTIL_MD5_URL=oss://hk4e-trans/server_bin/hk4e_${PROGRAM_BR}/${FILENAME_MD5}.$VERSION
    ossutil cp -f $OSSUTIL_BIN_URL ${DEST_DIR}/${FILENAME} || job_fail "下载程序文件失败"
	ossutil cp -f $OSSUTIL_MD5_URL ${DEST_DIR}/${FILENAME_MD5} || job_fail "下载程序md5文件失败"
	
	#check md5
	cd ${DEST_DIR}
	MD5=`cat ${FILENAME}.md5 |awk '{print $1}'`
	FMD5=`md5sum ${FILENAME} | awk '{print $1}'`

	if [ "${MD5}" == "${FMD5}" ]; then
			tar xf ${FILENAME} || job_fail "解压配置文件失败"
			ln -snf ${COMPONENT_DIR}/${VERSION} ${COMPONENT_DIR}/current
			echo -e "[Download Program OK]" 
	else
			job_fail "MD5监测失败"
	fi	
}

get_code