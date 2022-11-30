#!/usr/bin/env python
# -*- coding: UTF-8 -*-


#测试环境sign_key 1d8z98SAKF98bdf878skswa8kdjfy1m9dses
#正式环境 e3b966f709f57adc80c01f174ea8c23ebb7773bd

import sys, os
import hashlib

def main():
    print sys.argv
    if len(sys.argv) < 3:
        print "cal_sign_field.py para_str sign_key"
        return

    para_str = sys.argv[1]
    kvs = para_str.split("&")
    para_list = []
    for kv in kvs:
        key, value = kv.split("=")
        if value != "" and value != "sign":
            para_list.append((key, value))
    para_list.sort(key = lambda kv: kv[0])
    #print para_list

    para_list = [kv[0] + '=' + kv[1] for kv in para_list]
    content = '&'.join(para_list)

    sha256 = hashlib.sha256()
    sha256.update(content + sys.argv[2])
    print sha256.hexdigest()

if __name__ == "__main__":
    main()
