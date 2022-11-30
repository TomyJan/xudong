#!/usr/bin/python2
#-*- coding: utf8 -*-

import os
import sys
import traceback
import subprocess
from build_conf import *
from common import server_type_list


# 使用说明 区服名 环境名 测试服名test product

def usage():
    print("usage:")
    print("\t%s <region_name> <env_name>" % sys.argv[0])


def main(table):
    # table是一个Json字段 可以用Json formate 格式化看看
    # print(table) 
    #print(table['mysql'])
    mysqlInfo = table['mysql']
    #获取mysql 等账号信息
    HOST=mysqlInfo[0]['host']

    PORT=mysqlInfo[0]['port']
                
    USER=mysqlInfo[0]['user']
                
    PWD=mysqlInfo[0]['pwd']
    # 目前来说都是这个字段没有实际意义 暂定一直用这个
    VERSION="0.1"

    DBNAME_CONFIG=""

    DBNAME_ORDER=""

    DBNAME_USER=""

    #print(HOST,PORT,USER,PWD,VERSION)

    for  db in  mysqlInfo:
        if db['index'] == 2001: # order 表
            DBNAME_ORDER = db['dbname']
        if db['index'] == 1001: # config 表
            DBNAME_CONFIG = db['dbname']
        if db['index'] == '1': # user id 表
            DBNAME_USER = db['dbname']
    #print(DBNAME_ORDER,DBNAME_CONFIG,DBNAME_USER)

    ## 如果上述参数有任何一个为空 都退出不更新
    if HOST == "":
        print("YAML中读取不到MYSQL HOST 参数 ,更新失败")
        return
    if PORT == "":
        print("YAML中读取不到MYSQL PORT 参数 ,更新失败")
        return
    if USER == "":
        print("YAML中读取不到MYSQL USER 参数 ,更新失败")
        return
    if PWD == "":
        print("YAML中读取不到MYSQL PWD 参数 ,更新失败")
        return
    if DBNAME_CONFIG == "":
        print("YAML中读取不到MYSQL DBNAME_CONFIG 参数 ,更新失败")
        return
    if DBNAME_ORDER == "":
        print("YAML中读取不到MYSQL DBNAME_ORDER 参数 ,更新失败")
        return
    if DBNAME_USER == "":
        print("YAML中读取不到MYSQL DBNAME_USER 参数 ,更新失败")
        return

    ## 开始更新
    subprocess.call(['bash', 'update_sql.sh', HOST,PORT,USER,PWD,VERSION,DBNAME_CONFIG,DBNAME_ORDER,DBNAME_USER])

def diff_sql(table):
    # table是一个Json字段 可以用Json formate 格式化看看
    # print(table) 
    #print(table['mysql'])
    mysqlInfo = table['mysql']
    #获取mysql 等账号信息
    HOST=mysqlInfo[0]['host']

    PORT=mysqlInfo[0]['port']
                
    USER=mysqlInfo[0]['user']
                
    PWD=mysqlInfo[0]['pwd']
    # 目前来说都是这个字段没有实际意义 暂定一直用这个
    VERSION="0.1"

    DBNAME_CONFIG=""

    DBNAME_ORDER=""

    DBNAME_USER=""

    # print(HOST,PORT,USER,PWD,VERSION)

    for  db in  mysqlInfo:
        if db['index'] == 2001: # order 表
            DBNAME_ORDER = db['dbname']
        if db['index'] == 1001: # config 表
            DBNAME_CONFIG = db['dbname']
        if db['index'] == '1': # user id 表
            DBNAME_USER = db['dbname']
    # print(DBNAME_ORDER,DBNAME_CONFIG,DBNAME_USER)

    ## 如果上述参数有任何一个为空 都退出不更新
    if HOST == "":
        print("YAML中读取不到MYSQL HOST 参数 ,更新失败")
        return
    if PORT == "":
        print("YAML中读取不到MYSQL PORT 参数 ,更新失败")
        return
    if USER == "":
        print("YAML中读取不到MYSQL USER 参数 ,更新失败")
        return
    if PWD == "":
        print("YAML中读取不到MYSQL PWD 参数 ,更新失败")
        return
    if DBNAME_CONFIG == "":
        print("YAML中读取不到MYSQL DBNAME_CONFIG 参数 ,更新失败")
        return
    if DBNAME_ORDER == "":
        print("YAML中读取不到MYSQL DBNAME_ORDER 参数 ,更新失败")
        return
    if DBNAME_USER == "":
        print("YAML中读取不到MYSQL DBNAME_USER 参数 ,更新失败")
        return

    ## 开始更新
    subprocess.call(['bash', 'diff_sql.sh', HOST,PORT,USER,PWD,VERSION,DBNAME_CONFIG,DBNAME_ORDER,DBNAME_USER])


if __name__ == "__main__":
    try:
        if len(sys.argv) < 3:
            usage()
            exit(0)
        region_name = sys.argv[1]
        # env 值填线上的和
        env = sys.argv[2]
        table, _ = read_yaml_files(region_name, env)

        ## diff 变化
        diff_sql(table)

        while(True):
            print("是否要更新数据库sql表结构。按Y/N 确认")
            in_cmd = raw_input("请输入：")
            if in_cmd == "Y" or in_cmd == "y":
                main(table)
                print("sql更新结束")
                exit(0)
            elif in_cmd == "N" or in_cmd == "n":
                print("sql不更新,程序退出")
                exit(0)
            else:
                print("输入内容有误，请重新输入。")
    except Exception as e:
        print traceback.print_exc()
        exit(-1)