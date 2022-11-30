# 获取参数

# 和运维那边确认后 DBNAME的命名规范都是 hk4e_db_order_区服名 hk4e_db_config_区服名 hk4e_db_user_区服名
# 只要传区服名进来即可 但是注意：区服名可能有下划线 统一做去除下划线处理 比如cb3_dev --->  cb3dev
# 测试用例 bash update_sql.sh cb3dev 172.17.0.1 43306 root 111111



echo ""
echo ""
echo "################# update sql 开始 相关参数如下####################"


HOST="$1"

PORT="$2"
            
USER="$3"
            
PWD="$4"

VERSION="$5"

DBNAME_CONFIG="$6"

DBNAME_ORDER="$7"

DBNAME_USER="$8"

echo HOST:$HOST

echo PORT:$PORT

echo USER:$USER

echo PWD:$PWD

echo VERSION:$VERSION

echo DBNAME_CONFIG:$DBNAME_CONFIG

echo DBNAME_ORDER:$DBNAME_ORDER

echo DBNAME_USER:$DBNAME_USER


# HOST='172.17.0.1'
            
# PORT='43306'
            
# USER="root"
            
# PWD="111111"

SQL_FILE_PATH="../sql_temp/$VERSION"


# 还要对update_sql里是否有drop操作进行二次确认 如果有直接退出
# 判断是否有 DROP 行为   cat update_hk4e_db_config.sql | grep DROP
# 判断是否有 DROP 表行为 cat update_hk4e_db_config.sql | grep DROP | grep COLUMN

# 1. 使用 schemalex 生成update.sql


## 1.1 update hk4e_db_config

echo ""
echo ""
echo "################# 开始更新Config 表####################"

SQL_TEMP_FILE=${SQL_FILE_PATH}/hk4e_db_config.sql

# -t 开启事务 保证这一序列操作的原子性 要么都不做 要么都做  

./../../schemalex_tool/bin/schemalex -o update_hk4e_db_config.sql -t "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_CONFIG}" ${SQL_TEMP_FILE}

if [ $? -ne 0 ]
then
    echo "#############Config 表 SQL语法校验未通过 解析SQL模板文件失败################"
    exit 1
fi

### 二次校验DROP


cat update_hk4e_db_config.sql | grep DROP
if [ $? -ne 0 ]
then
    echo "############# Config 表 DROP字段二次校验通过 ################"
    ## 更新Config表
    #mysql -h ${HOST} -u ${USER} -P ${PORT} -p${PWD} -D${DBNAME} < update_hk4e_db_config.sql

    cat update_hk4e_db_config.sql
    UPDATE_CONFIG=`mysql -h ${HOST} -u ${USER} -P ${PORT} -p${PWD} -D${DBNAME_CONFIG}  --default-character-set=utf8mb4 < update_hk4e_db_config.sql`

    ${UPDATE_CONFIG}

    echo "################# Config 表 更新成功####################"

else
    echo "############# Config 表 DROP字段二次校验未通过 update sql里有DROP操作 跳过 不执行update_hk4e_db_config.sql################"
fi


## 1.2 update hk4e_db_order

echo ""
echo ""
echo "################# 开始更新Order表####################"

SQL_TEMP_FILE=${SQL_FILE_PATH}/hk4e_db_order.sql

./../../schemalex_tool/bin/schemalex -o update_hk4e_db_order.sql -t  "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_ORDER}" ${SQL_TEMP_FILE}

if [ $? -ne 0 ]
then
    echo "############# Order 表 SQL语法校验未通过 解析SQL模板文件失败################"
    exit 1
fi

### 二次校验DROP 校验成功才执行
cat update_hk4e_db_order.sql | grep DROP
if [ $? -ne 0 ]
then
    echo "############# Order 表 DROP字段二次校验通过 ################"
    ## 更新Order表
    UPDATE_ORDER=`mysql -h ${HOST} -u ${USER} -P ${PORT} -p${PWD} -D${DBNAME_ORDER} --default-character-set=utf8mb4 < update_hk4e_db_order.sql`
    ${UPDATE_ORDER}
    echo "################# 更新Order表成功 ####################"
else
    echo "############# Order 表 DROP字段二次校验未通过 update sql里有DROP操作 跳过 不执行update_hk4e_db_order.sql ################"
fi





## 此处需要将player block uid 数据合成同一个sql文件 不然再生成update.sql的过程中 会因为缺少表drop掉一些没有的表
## 1.3 update user
echo ""
echo ""
echo "################# 开始更新User表 ####################"

OUTPUT_FILE_NAME=docker_hk4e_db_user_oyjc.sql

SQL_TEMP_FILE=${SQL_FILE_PATH}/t_player_data.sql

## 1.3.1 update t_player_data
for((IDX=0; IDX<10; IDX++))
do
    SQL="""`cat ${SQL_TEMP_FILE}|sed "s#{idx}#${IDX}#g"`"""
    echo ${SQL} >> ${OUTPUT_FILE_NAME};
done


## 1.3.2 update t_block_data

SQL_TEMP_FILE=${SQL_FILE_PATH}/t_block_data.sql

for((IDX=0; IDX<10; IDX++))
do
     SQL="""`cat ${SQL_TEMP_FILE}|sed "s#{idx}#${IDX}#g"`"""
     echo ${SQL} >> ${OUTPUT_FILE_NAME};
done


## 1.3.3 update t_player_uid

SQL_TEMP_FILE=${SQL_FILE_PATH}/t_player_uid.sql

SQL="`cat ${SQL_TEMP_FILE}`"

echo ${SQL} >> ${OUTPUT_FILE_NAME};

## 1.3.4 t_player_online_id_data
SQL_TEMP_FILE=${SQL_FILE_PATH}/t_player_online_id_data.sql

SQL="`cat ${SQL_TEMP_FILE}`"

echo ${SQL} >> ${OUTPUT_FILE_NAME};

## update t_player_psn_online_id_data
SQL_TEMP_FILE=${SQL_FILE_PATH}/t_player_psn_online_id_data.sql

SQL="`cat ${SQL_TEMP_FILE}`"

echo ${SQL} >> ${OUTPUT_FILE_NAME};

## 1.3.2 update t_home_data
SQL_TEMP_FILE=${SQL_FILE_PATH}/t_home_data.sql
for((IDX=0; IDX<10; IDX++))
do
     SQL="""`cat ${SQL_TEMP_FILE}|sed "s#{idx}#${IDX}#g"`"""
     echo ${SQL} >> ${OUTPUT_FILE_NAME};
done


./../../schemalex_tool/bin/schemalex -o update_hk4e_db_user.sql -t  "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_USER}" ${OUTPUT_FILE_NAME}

if [ $? -ne 0 ]
then
    echo "############# User表 SQL语法校验未通过 解析SQL模板文件失败################"
    rm -rf ${OUTPUT_FILE_NAME}
    exit 1
fi

rm -rf ${OUTPUT_FILE_NAME}




### 二次校验DROP


cat update_hk4e_db_user.sql | grep DROP
if [ $? -ne 0 ]
then
    echo "############# User 表 DROP字段二次校验通过 ################"
    ## 更新User表

    #mysql -h ${HOST} -u ${USER} -P ${PORT} -p${PWD} -D${DBNAME} < update_hk4e_db_user.sql
    UPDATE_USER=`mysql -h ${HOST} -u ${USER} -P ${PORT} -p${PWD} -D${DBNAME_USER} --default-character-set=utf8mb4 < update_hk4e_db_user.sql`

    ${UPDATE_USER}

    echo "################# 更新User表成功 ####################"
else
    echo "############# User 表 DROP字段二次校验未通过 update sql里有DROP操作 跳过 不执行 update_hk4e_db_user.sql ################"
fi


## 清理中间产物

rm update_hk4e_db_user.sql

rm update_hk4e_db_order.sql

rm update_hk4e_db_config.sql
