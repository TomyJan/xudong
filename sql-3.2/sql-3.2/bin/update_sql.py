#!/usr/bin/python2
#-*- coding: utf8 -*-

import os
import sys
import traceback
import subprocess
from build_conf import *
from common import server_type_list


def usage():
    print("usage:")
    print("\t%s <region_name> " % sys.argv[0])

def main(table): 
    mysqlInfo = table['mysql']
    #获取mysql 等账号信息
    info_dict=dict()
    info_dict["HOST"] = mysqlInfo[0]['host']
    info_dict["PORT"] = mysqlInfo[0]['port'] 
    info_dict["USER"] = mysqlInfo[0]['user']
    info_dict["PWD"] = mysqlInfo[0]['pwd']
    # 目前来说version都是这个字段没有实际意义 暂定一直用这个
    info_dict["VERSION"] = "0.1"

    db_name_dict=dict()
    for db in mysqlInfo:
        if db['name'] == 'db_hk4e_order':
            db_name_dict["ORDER"] = db['dbname']
        if db['name'] == 'db_hk4e_local':
            db_name_dict["CONFIG"] = db['dbname']
        if db['name'] == 'user_id':
            db_name_dict["USER"] = db['dbname']

    ## 如果上述参数有任何一个为空 都退出不更新
    for (k,v) in info_dict.items():
        if v == "":
            print("YAML中读取不到MYSQL " + k + " 参数 ,更新失败")
            exit(1)
    for (k,v) in db_name_dict.items():
        if v == "":
            print("YAML中读取不到MYSQL " + k + " 参数 ,更新失败")
            exit(1)

    SQL_FILE_PATH = os.path.join("../sql_temp/",info_dict["VERSION"])
    sql_temp_file_dict = dict()
    sql_temp_file_dict["CONFIG"] = os.path.join(SQL_FILE_PATH,"hk4e_db_config.sql")
    sql_temp_file_dict["ORDER"] = os.path.join(SQL_FILE_PATH,"hk4e_db_order.sql")
    user_update_sql_path = "update_hk4e_db_user.sql"
    subprocess.check_call("sh sql_info_merge.sh " + user_update_sql_path + " " + SQL_FILE_PATH,shell=True)
    sql_temp_file_dict["USER"] = user_update_sql_path

    mysql_args_dict = info_dict
    sql_diff = dict()
    for (tbl_name,db_full_name) in db_name_dict.items():
        mysql_args_dict["DB_NAME"] = db_full_name
        mysql_args_dict["SQL_TEMP_FILE"] = sql_temp_file_dict[tbl_name]
        diff_check_result = generate_tmp_update_sql(tbl_name,mysql_args_dict)
        sql_diff[tbl_name] = diff_check_result
    
    if not True in sql_diff.values():
        for tbl_name in db_name_dict.keys():
            os.remove(tbl_name+"_tmp_update.sql")
        os.remove(user_update_sql_path)
        exit(0)

    print("是否要更新数据库sql表结构。按Y/N 确认")
    if not check_user_choose():
        print("sql不更新,程序退出")
        for tbl_name in db_name_dict.keys():
            os.remove(tbl_name+"_tmp_update.sql")
        os.remove(user_update_sql_path)
        exit(0)

    for (tbl_name,db_full_name) in db_name_dict.items():
        if not sql_diff[tbl_name]:
            continue
        mysql_args_dict["DB_NAME"] = db_full_name
        mysql_args_dict["SQL_TEMP_FILE"] = sql_temp_file_dict[tbl_name]
        update_tbl(tbl_name,mysql_args_dict)
    
    for tbl_name in db_name_dict.keys():
        os.remove(tbl_name+"_tmp_update.sql")
    os.remove(user_update_sql_path)

#使用schemalex 生成更新所用的sql语句：update.sql
def generate_tmp_update_sql(TBL_NAME,mysql_args_dict):
    SCHEMALEX_PATH = "./../../schemalex_tool/bin/schemalex"
    # schemalex -t 开启事务 保证这一序列操作的原子性 要么都不做 要么都做  
    tmp_update_sql_name = TBL_NAME + "_tmp_update.sql"
    args = " -o " + tmp_update_sql_name +' -t "mysql://{USER}:{PWD}@tcp({HOST}:{PORT})/{DB_NAME}" {SQL_TEMP_FILE}'.format(**mysql_args_dict)
    res = subprocess.call(SCHEMALEX_PATH+args,shell=True)
    if res != 0:
        print("############# " + TBL_NAME + " 表 SQL语法校验未通过 解析SQL模板文件失败################")
        exit(1)

    check = False
    with open(tmp_update_sql_name) as file:
        for line in file:
            if "TABLE" in line:
                check = True
    if check:
        print("################# " + TBL_NAME + " 表存在差异, diff内容如下 ################")
        with open(tmp_update_sql_name) as file:
            for line in file:
                line = line.strip()
                print(line)
    return check

def update_tbl(TBL_NAME,mysql_args_dict):
    print("################# 开始更新 "+ TBL_NAME + " 表####################")
    tmp_update_sql_name = TBL_NAME + "_tmp_update.sql"
    # 校验DROP
    check = False
    with open(tmp_update_sql_name) as file:
        for line in file:
            if "DROP" in line:
                check=True
                break
    if check:
        print("sql更新语句内包含DROP操作, 若要继续合并, 输入Y, 否则输入N")
        if not check_user_choose():
            return
    with open(tmp_update_sql_name) as file:
        args = " -h {HOST} -u {USER} -P {PORT} -p{PWD} -D{DB_NAME} --default-character-set=utf8mb4".format(**mysql_args_dict)
        subprocess.call("mysql" + args,stdin = file,shell = True)
    print("################# " + TBL_NAME + " 表 更新成功####################")

def check_user_choose():
    in_cmd = raw_input("请输入：")
    if in_cmd == "Y" or in_cmd == "y":
        return True
    elif in_cmd == "N" or in_cmd == "n":
        return False
    else:
        print("输入内容有误，请重新输入。")
        return check_user_choose()

if __name__ == "__main__":
    try:
        if len(sys.argv) < 2:
            usage()
            exit(1)
        region_name = sys.argv[1]
        table, _ = read_yaml_files(region_name, 'dev')
        # table是一个Json字段 可以用Json formate 格式化看看
        # print(table) 
        #print(table['mysql'])
        main(table)

    except Exception as e:
        print traceback.print_exc()
        exit(-1)