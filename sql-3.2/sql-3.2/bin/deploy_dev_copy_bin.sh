#!/bin/sh

WORKSPACE=`pwd`
echo "${WORKSPACE}"

OUTPUT_LIST="gateserver gameserver nodeserver dbgate dispatch muipserver multiserver httpproxy robot pathfindingserver oaserver tothemoonserver"
OUTPUT_DIR="$1"
LIB_OUTPUT_DIR="${OUTPUT_DIR}/lib/"

# 初始化output目录
rm ${OUTPUT_DIR} -rf && mkdir -p ${LIB_OUTPUT_DIR}

# 依次copy每个模块
for MODULE in ${OUTPUT_LIST}
do
    MODULE_DIR="${WORKSPACE}/${MODULE}"
    MODULE_OUTPUT_DIR="${OUTPUT_DIR}/${MODULE}"

    # copy bin run文件到output
    mkdir -p ${MODULE_OUTPUT_DIR} && cp ${MODULE_DIR}/${MODULE} ${MODULE_OUTPUT_DIR}/ && cp ${WORKSPACE}/tools/op_tools/bin/run ${MODULE_OUTPUT_DIR}/
    if [ $? -ne 0 ]
    then
        echo "cp  ${MODULE_DIR}/${MODULE} failed"
        exit 1
    fi

    if [ ${MODULE} = "robot" ]
    then
        cp -rf ${MODULE_DIR}/lua ${MODULE_OUTPUT_DIR}/
    fi

    # copy动态库到output
    cd ${MODULE_DIR}
    LD_LIBRARY_PATH="`make lib|grep LD_LIBRARY_PATH|awk -F "=" '{print $NF}'`"
    LIB_LIST="`ldd $MODULE|grep -E "ext|common|framework" |awk '{print $(NF-1)}'`"
    for LIB in ${LIB_LIST}
    do
        cp ${LIB} ${LIB_OUTPUT_DIR} -f
    done
done

# copy start.sh stop.sh status.sh
cp ${WORKSPACE}/common.sh ${WORKSPACE}/start.sh ${WORKSPACE}/stop.sh ${WORKSPACE}/status.sh ${WORKSPACE}/copy_jenkins_data.sh ${OUTPUT_DIR}/../

# copy gacha_simulate
cp -rf ${WORKSPACE}/tools/simulate_gacha ${OUTPUT_DIR}/../

cp -rf ${WORKSPACE}/tools/simulate_social ${OUTPUT_DIR}/../
