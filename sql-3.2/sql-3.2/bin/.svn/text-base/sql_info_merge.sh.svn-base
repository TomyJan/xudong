OUTPUT_FILE_NAME=$1
SQL_FILE_PATH=$2

## 1.3.1 update t_player_data

SQL_TEMP_FILE=${SQL_FILE_PATH}/t_player_data.sql

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