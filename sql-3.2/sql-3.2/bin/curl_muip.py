#!/usr/bin/env python
# -*- coding: UTF-8 -*-


import sys, os
import hashlib
import requests
from server_parse import * 

# 默认取第一台
def getMuipConfig(region, env="test", ip_str="inner_ip"):
    table, _ = read_yaml_files(region, env)
    server_fields = getServerFields(table, "muipserver", ip_str + "region_name,port_http,sign_key")
    if len(server_fields) == 0:
        return None, None, None, None, False
    return server_fields[0]["region_name"], server_fields[0][ip_str], server_fields[0]["port_http"], server_fields[0]["sign_key"], True

def main():
    if len(sys.argv) < 3:
        print("curl_muip.py region env para_str [out]")
        print "当第五个参数为out时使用外网ip"
        return
    region = sys.argv[1]
    env = sys.argv[2]
    r_qs = sys.argv[3]
    ip_str = "inner_ip" 
    if len(sys.argv) >= 5 and sys.argv[4].startswith("out"):
        ip_str = "outer_ip"
    region_name, muip_ip, muip_port, sign_key, succ = getMuipConfig(region, env, ip_str)
    if not succ:
        print("获取 [%s] 区 muip 配置失败。" % region)

    x = raw_input("将要对 [%s] 区 muip(实际 region_name [%s]) 执行命令 [%s], 是否确认?[Y/N]\n" % (region, region_name, r_qs)).lower().strip()
    if(x != "y"):
        print("放弃操作，退出。")
        return
    response = getRequeset(r_qs+"&region="+region_name, sign_key, "http://%s:%s/api?" %(muip_ip, muip_port))
    print(response)

def getRequeset(r_qs, sign_key, muip_uri):
    gen_sign_key = cal_sign_key(r_qs, sign_key)
    query_str = r_qs + "&sign=" + gen_sign_key
    print(muip_uri + query_str)
    return requests.get(muip_uri + query_str).json()

def cal_sign_key(para_str, sign_key):
    kvs = para_str.split("&")
    para_list = []
    for kv in kvs:
        key, value = kv.split("=")
        if value != "" and value != "sign":
            para_list.append((key, value))
    para_list.sort(key = lambda kv: kv[0])
    para_list = [kv[0] + '=' + kv[1] for kv in para_list]
    content = '&'.join(para_list)

    sha256 = hashlib.sha256()
    sha256.update(content + sign_key)
    return sha256.hexdigest()

if __name__ == "__main__":
    main()
