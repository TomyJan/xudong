#!/usr/bin/python2
#-*- coding: utf8 -*-

import sys
sys.dont_write_bytecode = True

import os
import yaml
import pprint
from xml.etree import ElementTree as et
from build_conf import *

def append_server_list(server_list, servers):
    for server_elem in servers:
        has_same = False
        for elem in server_list:
            if elem['id'] == server_elem['id']:
                has_same = True
                break
        if not has_same:
            server_list.append(server_elem)

def find_node_by_shortname(table, shortname):
    for key in table:
        node = table[key]
        if not isinstance(node, dict):
            continue
        if key == shortname or ('short_name' in node and node['short_name'] == shortname):
            return [key, node]
    return [None, None]

def find_node_in_table(table, name):
    if name in table:
        return table[name]
    return find_node_by_shortname(table, name)[1]

def find_servers(table, name):
    server_node = find_node_in_table(table, name)
    assert server_node != None, "module %s not found" % name
    if not isinstance(server_node, dict):
        return server_node
    servers = server_node['processes']
    for server in servers:
        server['work_path'] = os.path.join(table['work_path'], server['server_type']+'_'+server['app_id'])
    return servers

def getServerFields(table, module, fields):
    servers = find_servers(table, module)
    for server in servers:
        # 整体属性
        for key in table:
            if not isinstance(table[key], dict) and not isinstance(table[key], list) and key not in server:
                server[key] = table[key]
        # module属性
        module_node = find_node_in_table(table, module)
        if isinstance(module_node, dict):
            for key in module_node:
                if not isinstance(module_node[key], dict) and not isinstance(module_node[key], list) and key not in server:
                    server[key] = module_node[key]
        server_node = find_node_in_table(server, 'server')
        if isinstance(server_node, dict):
            for key in server_node:
                if not isinstance(server_node[key], dict) and not isinstance(server_node[key], list) and key not in server:
                    server[key] = server_node[key]
    return servers

def main():
    if len(sys.argv) < 2:
        print("usage:")
        print("\t%s <region>.<module> <fileds> <env>" % sys.argv[0])
        return

    region_name = ''
    module = ''
    fields = ['host']
    # 1.0_dev.game
    # 1.0_dev
    # 1.0.1_dev
    # 1.0_dev.*
    # 1.0_dev.all
    # cb_1.all
    # cb_1
    if '.' in sys.argv[1]:
        if sys.argv[1].count('.')>1:
            param_list = sys.argv[1].split('.')
            module = param_list[-1]
            for i in param_list[:-1]:
                region_name += i
                region_name += '.'
            region_name = region_name[:-1]
            if  module[0].isdigit():
                region_name = sys.argv[1]
                module = ''
        else:
            region_name, module = sys.argv[1].split('.')
            if  module[0].isdigit():
                 region_name = sys.argv[1]
                 module = ''
    else:
        region_name = sys.argv[1]

    if len(sys.argv) >= 3:
        fields = sys.argv[2].split(',')

    if len(sys.argv) >= 4:
        env = sys.argv[3]
    else:
        env = "test"		

    table, _ = read_yaml_files(region_name, env)
    if fields[0] == 'fullname':
        [name, _] = find_node_by_shortname(table, module)
        print name
        return
    servers = []
    if len(module) == 0 or module == 'all' or module == '' or module == '*':
        for module in server_type_list:
            servers.extend(getServerFields(table, module, fields))
    else:
        servers = getServerFields(table, module, fields)
    for server in servers:
        print '\t'.join([str(server[field]) for field in fields])
    return 


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print traceback.print_exc()
        exit(-1)
