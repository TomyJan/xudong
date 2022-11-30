#!/usr/bin/python2
# -*- coding: utf8 -*-

import os
import sys
import traceback
from build_conf import *
from xml.etree import ElementTree as et
import yaml
import mysql.connector
from collections import OrderedDict
OP_TOOLS_DIR = os.path.abspath(os.path.join(CUR_DIR, ".."))
CONF_DIR = os.path.join(OP_TOOLS_DIR, "conf")
GLOBAL_CONF_PATH = os.path.join(CONF_DIR, "global.xml")
PORT_BEGIN_PATH = os.path.join(CONF_DIR, "port_begin.txt")
DEV_CONF_PATH = os.path.join(CONF_DIR, "dev")


def usage():
    print("usage:")
    print("\t%s <region_name> <host>" % sys.argv[0])


def find_max_node_val(parent_node, node_name, attr_name, min_val):
    nodes = parent_node.findall(node_name)
    assert nodes is not None, "nodes is None"
    uid = min_val
    for node in nodes:
        if attr_name in node.attrib and node.attrib[attr_name] > uid:
            uid = node.attrib[attr_name]
    return uid


def find_mix_begin_port(region_name, min_val):
    port_begin = min_val
    port_begin_list = []
    with open(PORT_BEGIN_PATH, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if(line != "" and line != "\n"):
                port = line[-6:-1]
                if(line.startswith(region_name)):
                    port_begin = port
                port_begin_list.append(port)

    if(port_begin != min_val):
        return port_begin

    while(str(port_begin) in port_begin_list):
        port_begin = port_begin + 100
    with open(PORT_BEGIN_PATH, 'a') as f:
        f.write('{0}\t\t\t\t{1}\n'.format(region_name, port_begin))
    return port_begin


def dump_yaml(suffix_name, host, port_begin):

    region_name = "dev_{0}".format(suffix_name)
    regionData = OrderedDict()
    regionData['region_name'] = region_name
    regionData['work_path'] = os.path.abspath(
        os.path.join(OP_TOOLS_DIR, '../../env'))
    regionData['port_begin'] = int(port_begin)
    regionData['server_list'] = [{
        'id': 1,
        'host': host,
        'inner_ip': host,
        'outer_ip': host,
    }]
    regionData['dbgate'] = {
        'short_name': 'dg',
        'thread_num': '2',
        'stat_log_level': '',
        'servers': [{
            'host': '1',
            'num': 1
        }],
        'register_rate_conf': [{
            'period_length': 10,
            'max_register_num': 2,
            'max_punish_value': 60
        }]
    }
    regionData['mysql'] = {
        'user_db': {
            'dbname': 'db_hk4e_user_{0}'.format(suffix_name)},
        'config_db': {
            'db_list': [{
                'index': 1001,
                'dbname': 'db_hk4e_config_{0}'.format(suffix_name)
            }]
        },
        'data_db': {
            'db_list': [{
                'index': 2001,
                'dbname': 'db_hk4e_order_{0}'.format(suffix_name)
            }]
        }
    }
    regionData['redis'] = {
        'host': host,
        'db': '13'
    }

    class OrderedDumper(yaml.SafeDumper):
        pass

    def _dict_representer(dumper, data):
        return dumper.represent_mapping(
            yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG,
            data.items())
    OrderedDumper.add_representer(OrderedDict, _dict_representer)
    with open(os.path.join(DEV_CONF_PATH, "{0}.yaml".format(region_name)), 'w') as yaml_file:
        yaml.dump(
            regionData,
            yaml_file,
            OrderedDumper,
            default_flow_style=False)


def append_global(region_name):
    global_root = et.parse(GLOBAL_CONF_PATH).getroot()
    region_node = find_node(global_root, "Region", "name", region_name)
    if region_node is not None:
        return
    new_region_id = int(find_max_node_val(
        global_root, "Region", "region_id", 900)) + 1
    region_val = '\t<Region name="{0}" conf_file="dev/{0}.yaml" region_id="{1}"/>\n'.format(
        region_name, str(new_region_id))
    with open(GLOBAL_CONF_PATH, "r") as f:
        contents = f.readlines()

    contents.insert(-1, region_val)

    with open(GLOBAL_CONF_PATH, "w") as f:
        contents = "".join(contents)
        f.write(contents)


def create_database(suffix_name):

    region_name = "dev_{0}".format(suffix_name)
    table, _ = read_yaml_files(region_name, 'dev')
    mysqlInfo = table['mysql']

    mydb = mysql.connector.connect(
        host=mysqlInfo[0]['host'],
        user=mysqlInfo[0]['user'],
        passwd=mysqlInfo[0]['pwd']
    )

    mycursor = mydb.cursor()

    mycursor.execute(
        "CREATE DATABASE IF NOT EXISTS db_hk4e_user_{0}".format(suffix_name))
    mycursor.execute(
        "CREATE DATABASE IF NOT EXISTS db_hk4e_config_{0}".format(suffix_name))
    mycursor.execute(
        "CREATE DATABASE IF NOT EXISTS db_hk4e_order_{0}".format(suffix_name))


def main():
    if len(sys.argv) < 3:
        usage()
        return
    region_name = sys.argv[1]
    suffix_name = region_name.split('_')[-1]
    host = sys.argv[2]

    # step 1: write dev_xxx.xml
    print('- 生成开发用配置dev_{0}.yaml'.format(suffix_name))
    port_begin = find_mix_begin_port(region_name, 19901)
    dump_yaml(suffix_name, host, port_begin)
    print(
        '- filename: tools/op_tools/conf/dev/dev_{0}.yaml'.format(suffix_name))
    print('- begin port:{0}'.format(port_begin))

    # step 2: write global_xxx.xml
    append_global(region_name)
    print('- 将区服dev_{0}添加到conf/global.xml'.format(suffix_name))

    # step 3: create table
    # db_hk4e_user_xxx,db_hk4e_config_xxx,db_hk4e_order_xxx
    create_database(suffix_name)
    print(
        '- 创建数据库db_hk4e_user_{0},db_hk4e_config_{0},db_hk4e_order_{0}'.format(suffix_name))

    # tips that contrat wudong
    print('- !!请联系吴冬(dong.wu@mihoyo.com)将区服添加到global_deploy_config')


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(traceback.print_exc())
        exit(-1)
