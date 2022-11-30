# -*- coding: utf-8 -*-

import redis
import sys
import os

OfflineMsgRedisIndex = 3

def getRegionRedisParam(region, redis_index):
    p = os.popen('python server_parse.py {0}.redis index,host,port,pwd,db'.format(region), 'r')
    output = p.read()
    redis_param_lines = output.strip().split("\n")
    for line in redis_param_lines:
        elems = line.strip().split("\t")
        if len(elems) == 5 and elems[0] == str(redis_index):
            return elems

def getOfflineMsgRedisData(region, uid):
    ret = getRegionRedisParam(region, OfflineMsgRedisIndex)
    if not ret or len(ret) != 5:
        return
    _, host, port, pwd, db = ret
    if not host:
        return
    
    try:
        r = redis.Redis(host=host, port=port, db=db, password=pwd)
        offline_msg = r.get('OfflineMsg:'+uid)
    except Exception as e:
        print "get except: ", e
        return
    else:
        return offline_msg

def setOfflineMsgRedisData(region, uid, offline_msg):
    ret = getRegionRedisParam(region, OfflineMsgRedisIndex)
    if not ret or len(ret) != 5:
        return -1
    _, host, port, pwd, db = ret
    if not host:
        return -1

    try:
        r = redis.Redis(host=host, port=port, db=db, password=pwd)
        r.set('OfflineMsg:'+uid, offline_msg)
    except Exception as e:
        print "set except: ", e
        return -1
    else:
        return 0


def main():
    if len(sys.argv) != 5:
        print "usage: ", sys.argv[0], " source_region, source_uid, dest_region, dest_uid"
        sys.exit(-1)

    source_region = sys.argv[1]
    source_uid = sys.argv[2]
    dest_region = sys.argv[3]
    dest_uid = sys.argv[4]

    source_offline_msg = getOfflineMsgRedisData(source_region, source_uid)
    if source_offline_msg is None:
        source_offline_msg = ""

    if 0 != setOfflineMsgRedisData(dest_region, dest_uid, source_offline_msg):
        print 'setOfflineMsgRedisData fails'
        sys.exit(-1)

    print "Copy OK"
    
    # 方便shell获取返回值
    sys.exit(0)


if __name__ == '__main__':
    main()
