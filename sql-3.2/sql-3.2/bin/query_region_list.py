#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys
import requests
import base64
import struct
from python_pb import define_pb2

def main():
    if len(sys.argv) < 4:
        print("usage: query_region_list ip:port version account_type")
        return

    # TODO...后续直接支持region_name
    ip_port = sys.argv[1]
    if ip_port.find(":") < 0:
        print("ip:port format error")
        return

    version = sys.argv[2]
    account_type = sys.argv[3]

    url = "https://{}/query_region_list?version={}&account_type={}".format(ip_port, version, account_type)
    r = requests.get(url)
    if r.status_code != 200:
        print(r.status_code)
        return

    pb_str = base64.b64decode(r.content)
    #print(pb_str)

    region_info = define_pb2.QueryRegionListHttpRsp()
    region_info.ParseFromString(pb_str)

    '''
    # 解码
    # 按字节异或，key按照key_len循环取值。
    str_len = len(region_info.client_custom_config_encrypted)
    key_len = len(region_info.client_secret_key)
    client_custom_config = bytes()
    if key_len != 0:
        for i in range(0, str_len):
            byte_config = ord(region_info.client_custom_config_encrypted[i])
            byte_key = ord(region_info.client_secret_key[i % key_len])
            rst = byte_config ^ byte_key
            client_custom_config += chr(rst).encode('UTF-8')
           
    # config_str = client_custom_config.encode('UTF-8')

    # 将加密字段和密钥置空
    region_info.client_secret_key = ""
    region_info.client_custom_config_encrypted = ""
    '''

    # 打印
    print(region_info)
    print("client_custom_config: " + client_custom_config)

if __name__ == "__main__":
    main()
