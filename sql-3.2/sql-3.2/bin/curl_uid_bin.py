#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from curl_muip import *
import json

def main():
    if len(sys.argv) < 4:
        print "curl_uid_bin.py region env uid [out]"
        print "当第四个参数为out时使用外网ip"
        return
    region = sys.argv[1]
    env = sys.argv[2]
    r_qs = "cmd=1004&uid=" + sys.argv[3]
    ip_str = "inner_ip"
    if len(sys.argv) >= 5 and sys.argv[4].startswith("out"):
        ip_str = "outer_ip"
    region_name, muip_ip, muip_port, sign_key, succ = getMuipConfig(region, env, ip_str)
    if not succ:
        print("获取 [%s] 区 muip 配置失败。" % region)
    response = getRequeset(r_qs+"&region="+region_name, sign_key, "http://%s:%s/api?" %(muip_ip, muip_port))
    print(json.dumps(response["data"], indent=2, ensure_ascii=False).encode("utf-8"))

if __name__ == "__main__":
    main()
