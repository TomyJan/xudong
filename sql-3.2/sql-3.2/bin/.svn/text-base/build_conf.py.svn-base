#!/usr/bin/python2
#-*- coding: utf8 -*-

# 1. 由模板根据yaml自动生成xml，给yaml和模板加字段后不用再改build_conf。
# 2. common.yaml和region_name.yaml是包含关系，通用字段不用所有yaml都改一遍，加新区时不用复制所有字段再改。
# 3. 端口号根据yaml中的port_begin字段自动生成。

# 合并[dict]类型的数组时，需要用这里指定的字段来区分两个元素是不是同一个元素，相同的元素会合并，不同的元素会都保留
# 合并其他类型的数组时，会用新的数组覆盖旧的数组
LIST_INDEX_NAMES = ['index', 'id', 'name', 'host', 'platform_type', 'check_type', 'item_id']

import re
import os
import sys
import yaml
import jinja2
import getopt
import traceback
import itertools
from xml.etree import ElementTree as et
from build_deploy import *
from common import server_type_list, all_server_type_list

sys.dont_write_bytecode = True

CUR_DIR = os.path.dirname(os.path.realpath(__file__))
OP_TOOLS_DIR = os.path.abspath(os.path.join(CUR_DIR, ".."))
CONF_DIR = os.path.join(OP_TOOLS_DIR, "conf")
CONF_TEMP_DIR = os.path.join(OP_TOOLS_DIR, "conf_temp")
GLOBAL_CONF_PATH = os.path.join(CONF_DIR, "global.xml")

# 帮助
def usage():
    print("usage:")
    print("\t%s --region <region_name> --env <env[dev|test|prod]> --build_ver <build_ver> [--dir <output_dir> --server_list 'gameserver gateserver ...']" % sys.argv[0])
    sys.exit(-1)

def str2bool(v):
  return v.lower() in ("yes", "true", "t", "1")

# 查找xml节点
def find_node(parent_node, node_name, attr_name, attr_value):
    res_node = None
    nodes = parent_node.findall(node_name)
    assert nodes != None, "nodes is None"
    for node in nodes:
        if node.attrib.has_key(attr_name) and node.attrib[attr_name] == attr_value:
            res_node = node
            break
    return res_node

# 将yaml格式的文件解析成dict
def parse_yaml(*file_paths):
    path = ''
    for file_path in file_paths:
        path = os.path.join(path, file_path)
    with open(path, 'rb') as fp:
        temp_stderr = sys.stderr
        sys.stderr = open('/dev/null', 'w')
        table = yaml.load(fp)
        sys.stderr = temp_stderr
        if not table:
            table = {}
        return table
    assert False, "parse_yaml fail. path: %s" % path
    return None

# 用from_table中的字段覆盖table中的字段
def merge(table, from_table):
    assert isinstance(table, dict) and isinstance(from_table, dict), \
            "table type is not dict. type(table): %s type(from_table): %s" % (type(table), type(from_table))
    assert from_table != None, "from_table is None"
    for key in from_table:
        value = from_table[key]
        if key not in table:
            table[key] = value
            continue
        if value != None or not isinstance(table[key], list):
            assert type(table[key]) == type(value), \
                    "different type. field %s. type(table[key]): %s. type(value): %s" % (key, type(table[key]), type(value))
        if isinstance(value, dict):
            merge(table[key], value)
        elif isinstance(value, list):
            def add_elem(lst, from_elem):
                index_name = None
                for candidate_index_name in LIST_INDEX_NAMES:
                    if candidate_index_name in from_elem:
                        index_name = candidate_index_name
                        break
                assert index_name != None, "unknown list key in %s" % from_elem
                k = from_elem[index_name]
                for e in lst:
                    assert isinstance(e, dict), 'not dict: %s' % e
                    assert index_name in e, "index_name %s not in %s" % (index_name, e)
                    if e[index_name] == k:
                        merge(e, from_elem)
                        return
                lst.append(from_elem)
            if (len(value) != 0 and isinstance(value[0], dict)) or (len(table[key]) != 0 and isinstance(table[key][0], dict)):
                for from_elem in value:
                    add_elem(table[key], from_elem)
            else:
                table[key] = value
        elif value == None:
            table[key] = []
        else:
            table[key] = value
    return table

def get_support_server_list(region_type):
    if region_type == "normal":
        return copy.deepcopy(server_type_list)
    elif region_type == "dispatch":
        return ["dispatch"]
    elif region_type == "httpproxy":
        return ["httpproxy"]
    return []

# parse_region_conf总入口
def parse_region_conf(region_name, env):
    
    conf_table = {}
    if env != "dev":
        conf_type = "product" if env == "prod" else env
        if "dispatch" in region_name:
            conf_type = "dispatch"
        elif "httpproxy" in region_name:
            conf_type = "httpproxy"
        common_table = parse_yaml(CONF_DIR, '', conf_type, conf_type + '_' + "common.yaml")
        common_table["cmdb"] = getCMDBConf(env)
        remote_conf_table, succ = getRegionDiffConf(region_name, env)
        print "尝试从Opsmind({0})读取差异配置(diff_config)...  success: {1}".format(env,succ)
        # 读取区服专用的配置
        region_table = {}

        print "区服专有配置路径:" + CONF_DIR + "/" + conf_type + "/" + region_name + ".yaml"
        if os.path.exists(CONF_DIR + "/" + conf_type + "/" + region_name + ".yaml"):
            try:
                print "尝试读取区服专用配置: {0}...".format(region_name + ".yaml")
                region_table = parse_yaml(CONF_DIR, conf_type, region_name + ".yaml")
                print "尝试读取区服专用配置: {0}...done".format(region_name + ".yaml")
            except  Exception as e:
                print e
                print "读取区服专用配置失败, 请检查区服专有配置文件..."
                sys.exit(1)
        else:
            print "区服:{0}专有配置不存在,使用默认common.yaml配置".format(region_name + ".yaml")

        conf_table = merge(region_table, remote_conf_table) 
    else:
        root = et.parse(GLOBAL_CONF_PATH).getroot()
        region_node = find_node(root, 'Region', 'name', region_name)    
        assert region_node != None, \
                "region:%s found found in %s" % (region_name, GLOBAL_CONF_PATH)
        assert 'conf_file' in region_node.attrib, \
                "region:%s attrib conf_file not found in %s" % (region_name, GLOBAL_CONF_PATH)
        filename = region_node.attrib['conf_file']
        (filedir, conf_type) = os.path.split(os.path.dirname(filename))
        common_table = parse_yaml(CONF_DIR, filedir, conf_type, conf_type + '_' + "common.yaml")
        common_table["cmdb"] = getCMDBConf(env)
        conf_table = parse_yaml(CONF_DIR, filename)
        print "从本地Yaml文件读取差异配置...  filename: {}".format(filename) 
    table = merge(common_table, conf_table)
    if globals().get("build_ver"):
       table['build_ver']=build_ver
    table['env'] = env
    if env == 'dev' and 'region_id' in region_node.attrib.keys():
        table['region_id'] = region_node.attrib['region_id']
    else:
        table['opsmind_env'] = env
    region_type = table.get("region_type", "normal")
    return table, get_support_server_list(region_type)

# dev环境从配置中split deploy_config
def split_deploy_config(table, region_name):
    deploy_config = {}
    deploy_config['region_name'] = region_name
    deploy_config['work_path'] = table.pop('work_path')
    deploy_config['port'] = table.pop('port')
    deploy_config['region_id'] = table.pop('region_id')
    deploy_config['mysql'] = table.pop('mysql')
    deploy_config['redis'] = table.pop('redis')
    deploy_config['server_list'] = table.pop('server_list')
    for server_type in all_server_type_list:
        if server_type not in table:
            continue
        deploy_config[server_type] = {}
        deploy_config[server_type]['servers'] = table[server_type].pop('servers')
    return table, deploy_config
 

# 从cmdb拉取配置，并且合并
def merge_cmdb_config(region_name, table):
    # 0. dev环境先把deploy_config从table中抽出来
    if table['env'] == 'dev':
        print "区服:{0} 开发用配置，直接根据本地yaml生成进程配置".format(region_name)
        table, region_cmdb_config = split_deploy_config(table, region_name)
        deploy_config = genBuildConfConfigFromDevDeployConfig(region_cmdb_config)
    else:
        env = table.get('opsmind_env', 'prod')
        print "区服:{0} 尝试从Opsmind CMDB拉取进程配置信息，Opsmind环境为:{1}".format(region_name, env)
        deploy_config = getBuildConfConfig(region_name, env)

    # 1. table中更新server_type
    for server_type in all_server_type_list:
        if server_type in table:
            table[server_type]['server_type'] = getServerType(server_type)
    return merge(table, deploy_config)

# 重写mysql相关字段信息
def replace_mysql_fields(node):
    mysql_node = node['mysql']
    replaces1 = dict()
    # 用上级的字段重写下级的同名字段
    db_types = ['user_db', 'config_db', 'data_db']
    keys = ['user', 'pwd', 'dbname', 'host', 'port']
    for key in keys:
        if key in mysql_node:
            replaces1[key] = mysql_node[key]
    for db_type in db_types:
        if db_type not in mysql_node:
            continue
        db_group = mysql_node[db_type]
        replaces2 = dict()
        for key in keys:
            if key in db_group:
                replaces2[key] = db_group[key]
        for db_node in db_group['db_list']:
            for key in keys:
                if key not in db_node or len(db_node[key]) == 0:
                    if key in replaces2:
                        db_node[key] = replaces2[key]
                    elif key in replaces1:
                        db_node[key] = replaces1[key]
                    assert key in replaces1 or key in replaces2, "key: %s not in %s" % (key, db_type)
        for key in keys:
            db_group.pop(key, None)
    for key in keys:
        replaces1.pop(key, None)
        mysql_node.pop(key, None)

    # 删除中间字段
    #node['mysql'] = list(itertools.chain(*[mysql_node[db_type]['db_list'] for db_type in db_types]))
    node['mysql'] = list(itertools.chain(*[mysql_node[db_type]['db_list'] for db_type in db_types if db_type in mysql_node]))

# 重写redis相关字段信息
def replace_redis_fields(node):
    if 'redis' not in node:
        return
    redis_node = node['redis']
    keys = ['name', 'host', 'port', 'pwd', 'db', 'is_cluster']
    replaces = dict()
    for key in keys:
        if key in redis_node:
            replaces[key] = redis_node[key]
    for db_node in redis_node['db_list']:
        for key in keys:
            if key not in db_node or str(db_node[key]) == '':
                assert key in replaces, "key: %s not in redis.db_list" % (key)
                db_node[key] = replaces[key]
    # 删除中间字段
    node['redis'] = redis_node['db_list']

# 替换port
def replace_servers_port_dev(table):
    port_begin = table['port_begin']
    table.pop('port_begin')
    t = {'port_num': port_begin + 20}
    def recursive_change(field, nodes):
        if isinstance(nodes, list):
            for node in nodes:
                recursive_change('', node)
        elif isinstance(nodes, dict):
            for key in nodes:
                if isinstance(nodes[key], dict) or isinstance(nodes[key], list):
                    recursive_change(key, nodes[key])
                    continue
                if key == 'port_begin' or key == 'port_offset' or not key.startswith('port_') or (len(nodes[key]) != 0 and int(nodes[key]) != 0):
                    continue
                if field == 'dispatch' and key == 'port_http':
                    nodes[key] = port_begin
                elif field == 'muipserver' and key == 'port_http':
                    nodes[key] = port_begin + 10
                else:
                    nodes[key] = t['port_num']
                    t['port_num'] += 10
    recursive_change('', table)
    for server_type in all_server_type_list:
        if server_type not in table:
            continue
        port_dict = {}
        for key in table[server_type].keys():
            if key.startswith('port_') and not key == 'port_begin':
                port_dict[key] = table[server_type][key]
        for process in table[server_type]['processes']:
            process_port = port_dict.copy()
            for port in process_port:
                process_port[port] = str(int(process_port[port]) + process['port_offset'])
            process.update(process_port)
            process.pop('port_offset')

def replace_servers_port(table):
    for server_type in all_server_type_list:
        if server_type not in table:
            continue
        for process in table[server_type]['processes']:
            if 'port' in process:
                for key in process['port'].keys():
                    process[key] = process['port'][key]
            process.pop('port')

def replace_ports(table):
    # 只有开发环境可以自动生成端口号
    if table['env'] == 'dev':
       replace_servers_port_dev(table)
    else:
       replace_servers_port(table)

# 替换模板
def replace_templates(table, output_dir, server_name_list):
    server_name_list = ['template_' + server_name + '.xml' for server_name in server_name_list]
    env = jinja2.Environment(loader=jinja2.FileSystemLoader(CONF_TEMP_DIR), trim_blocks=True, lstrip_blocks=True)
    env.globals['str2bool'] = str2bool
    for root, dirs, files in os.walk(CONF_TEMP_DIR):
        for filename in files:
            if not filename.startswith('template_') or not filename.endswith('.xml'):
                continue
            if len(server_name_list) > 0 and filename not in server_name_list:
                continue
            filepath = os.path.join(root, filename)
            module_name = re.sub('.xml', '', re.sub('template_', '', filename))
            # print "going to render template file: %s" % filepath
            output_content = env.get_template(filename).render(conf=table).encode('utf-8')
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)
            output_filepath = os.path.join(output_dir, module_name, 'conf', module_name + '.xml')
            if not os.path.exists(os.path.dirname(output_filepath)):
                os.makedirs(os.path.dirname(output_filepath))
            with open(output_filepath, 'wb') as fp:
                print "output to file: %s" % output_filepath
                fp.write(output_content)

# 读取yaml配置
def read_yaml_files(region_name, env):
    table, support_server_list = parse_region_conf(region_name, env)
    if table['env'] != 'dev' and 'region_id' in table.keys():
        print "region_id of test and product region is configured in cmd"  
        exit(1)

    merge_cmdb_config(region_name, table)
    replace_mysql_fields(table)
    replace_redis_fields(table)
    replace_ports(table)
    return table, support_server_list 

def main():
    if len(sys.argv) < 2:
        usage()

    if "--" in str(sys.argv):
        try:
            options, args = getopt.getopt(sys.argv[1:], 
                    'hr:e:d:s:t:', 
                    ['help', 
                     'region=', 
                     'env=', 
                     'dir=', 
                     'server_list=', 
                     'build_ver='])
        except Exception as e:
            print e
            usage()
            return

        output_server_list = []
        for name, value in options:
            if name in ('-h', '--help'):
                usage()
            elif name in ('-r', '--region'):
                region_name = value
            elif name in ('-d', '--dir'):
                output_dir = value
            elif name in ('-e', '--env'):
                env = value
            elif name in ('-s', '--server_list'):
                output_server_list = value.split(' ')
            elif name in ('-t', '--build_ver'):
                global build_ver
                build_ver=value

        if not locals().get("region_name"):
            print "region_name未指定"
            print usage()

        elif not locals().get("env"):
            print "env未指定"
            print usage()

        elif not globals().get("build_ver"):
            print "build_ver未指定"
            print usage()

        output_server_list = [ x for x in output_server_list if x ]
        if not locals().get("output_dir"): output_dir = 'output'
    else:
        region_name = sys.argv[1]

        # 兼容现有环境
        if len(sys.argv) == 2:
            if region_name.startswith('dev') and "weekly" not in region_name:
                env = "dev"
            else:
                env = "test"
        else:
            if sys.argv[2] in ["dev", "prod", "test", "stage"]:
                env = sys.argv[2]
            else:
                env = "test"
                output_dir = sys.argv[2]
        if not locals().get("output_dir"): output_dir = 'output'
        ###

        if len(sys.argv) >= 4:
            output_dir = sys.argv[3]

        output_server_list = []
        if len(sys.argv) >= 5:
            for i in range(4, len(sys.argv)):
                output_server_list.append(sys.argv[i])


    ###########


    print "\033[36m 开始在 '%s' 生成分区 '%s' 的配置文件 \033[0m" % (output_dir, region_name)
    print "    确认？[Y/N]"
    if raw_input().lower() != 'y':
        return

    table, support_server_list = read_yaml_files(region_name, env)
    # 为空时直接使用支持列表, 否则
    if len(output_server_list) == 0:
        output_server_list = support_server_list
    else:
        output_server_list = [s for s in output_server_list if s in support_server_list]
    if len(output_server_list) == 0:
        print "\033[31m 输出server_list为空, 生成配置失败！ \033[0m"
        print "\033[31m 支持的server_list为%s \033[0m" % (','.join(support_server_list)) 


    # pp = pprint.PrettyPrinter(indent=4)
    # pp.pprint(table)
    replace_templates(table, output_dir, output_server_list)

if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print e
        print traceback.print_exc()
        exit(-1)

