#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys
import requests
import base64
from python_pb import define_pb2

def main():
    if len(sys.argv) < 4:
        print("usage: query_cur_region ip:port version platform [lang]")
        return

    # TODO...后续直接支持region_name
    ip_port = sys.argv[1]
    if ip_port.find(":") < 0:
        print("ip:port format error")
        return

    version = sys.argv[2]
    platform = sys.argv[3]
    lang = 0
    if len(sys.argv) > 4:
        lang = sys.argv[4]

    url = "http://{}/query_cur_region?version={}&platform={}&lang={}".format(ip_port, version, platform, lang)
    r = requests.get(url)
    if r.status_code != 200:
        print(r.status_code)
        return

    pb_str = base64.b64decode(r.content)
    #print(pb_str)
    region_info = define_pb2.QueryCurrRegionHttpRsp()
    region_info.ParseFromString(pb_str)
    print(region_info)

if __name__ == "__main__":
    main()
