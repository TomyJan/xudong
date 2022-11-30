#!/usr/bin/python2
#-*- coding: utf8 -*-

#计算server_type的编号
server_type_list = [
    'gateserver',
    'gameserver',
    'nodeserver',
    'dbgate',
    'dispatch',
    'muipserver',
    'multiserver',
    'pathfindingserver',
    'oaserver',
    'tothemoonserver',
]

# 额外的需要独立部署的server
misc_server_type_map = {
    'httpproxy': 99
}

all_server_type_list = server_type_list + [name for name in misc_server_type_map]

def getServerType(server):
    if server in misc_server_type_map:
        return misc_server_type_map[server]
    return server_type_list.index(server) + 1
