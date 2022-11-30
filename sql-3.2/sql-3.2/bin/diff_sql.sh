# 此处是diff 检查sql
echo "################# schemalex tools 版本信息如下####################"

./../../schemalex_tool/bin/schemalex -v

echo ""
echo ""
echo "################# diff sql 开始 ####################"


HOST="$1"

PORT="$2"
            
USER="$3"
            
PWD="$4"

VERSION="$5"

DBNAME_CONFIG="$6"

DBNAME_ORDER="$7"

DBNAME_USER="$8"


SQL_FILE_PATH="../sql_temp/$VERSION"


####################  diff config


echo
echo
echo "####################  diff config 表 ######################"

SQL_TEMP_FILE=${SQL_FILE_PATH}/hk4e_db_config.sql


# -t 开启事务 保证这一序列操作的原子性 要么都不做 要么都做  

./../../schemalex_tool/bin/schemalex -t "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_CONFIG}" ${SQL_TEMP_FILE}


####################  diff order
echo
echo
echo "####################  diff order 表 ######################"
SQL_TEMP_FILE=${SQL_FILE_PATH}/hk4e_db_order.sql

./../../schemalex_tool/bin/schemalex  -t  "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_ORDER}" ${SQL_TEMP_FILE}

####################  diff user

echo
echo
echo "####################  diff user 表 ######################"
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

## 1.3.5 t_home_data
SQL_TEMP_FILE=${SQL_FILE_PATH}/t_home_data.sql
for((IDX=0; IDX<10; IDX++))
do
	SQL="""`cat ${SQL_TEMP_FILE}|sed "s#{idx}#${IDX}#g"`"""
	echo ${SQL} >> ${OUTPUT_FILE_NAME};
done


 ./../../schemalex_tool/bin/schemalex -t  "mysql://${USER}:${PWD}@tcp(${HOST}:${PORT})/${DBNAME_USER}" ${OUTPUT_FILE_NAME}

rm -rf ${OUTPUT_FILE_NAME}


