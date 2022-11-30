#!/usr/bin/python2
#-*- coding: utf8 -*

import json
import requests
import copy
import yaml
from collections import defaultdict
from enum import Enum
from common import all_server_type_list, getServerType

OPSMIND_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJ0eXAiOiJKV1QifQ.eyJvcmciOiJlMzAzZTc4ZGM2ODUiLCJvd25lciI6ImNtZGJfYWNjb3VudC12MTpuZW8iLCJncmFudHMiOm51bGwsInBhcmVudHMiOlt7Im9yZyI6ImUzMDNlNzhkYzY4NSIsIm93bmVyIjoiY21kYl9hY2NvdW50LXYxOm5lbyIsImdyYW50cyI6bnVsbCwicGFyZW50cyI6bnVsbCwidmFsaWRfdG8iOjMzMTM3NDI0MDAwLCJ2YWxpZF9mcm9tIjoxNTkzNDAxNzA4LCJncmFudGVlIjpudWxsLCJzYWx0IjoiMTV1MmRlbSJ9XSwidmFsaWRfdG8iOjMzMTM3NDI0MDAwLCJ2YWxpZF9mcm9tIjowLCJncmFudGVlIjpudWxsLCJzYWx0IjoicjQybjYyIn0.VRS73mv6mjC0A9Y0YeuJDJKXiE9WxQhPBvjY4KMLpRCOQXCBQ5lGdUPV5pUh6OUtTi3NOLXhRoPNhOObcBb6mu5bVnzpkAa0eZJ-cDDTyxvUMnVxGyDj7kZqNENPLoO3CnMt9eKPGxsOFPWzTpl1b2bD9uuVueK_0JvoF8P5K6E"
PROCESS_API_URI="/api/v1/ecu/endpoints/cmdb_endpoint-1tk2maq48f19s"
OPSMIND_PROD = {
        "host":"prod-opsmind.yuanshen.com",
        "token":OPSMIND_TOKEN,
        "uri":PROCESS_API_URI,
        "is_ssl":True
    }

OPSMIND_TEST={
        "host":"test-opsmind.yuanshen.com",
        "token":OPSMIND_TOKEN,
        "uri":PROCESS_API_URI,
        "is_ssl":True
    }

OPSMIND_STAGE={
        "host":"mihoyo.private.opsmind.com",
        "token":OPSMIND_TOKEN,
        "uri":PROCESS_API_URI,
        "is_ssl":True
    }

PROCESS_API_URL="https://{0}{1}?region_value="
REGION_DIFF_CONFIG_API_URL="https://{0}/api/v1/ecu/endpoints/cmdb_endpoint-2auc2uyxpijxe?region_value="
OPSMIND_PROD_PROCESS_API_URL= PROCESS_API_URL.format(OPSMIND_PROD["host"], OPSMIND_PROD["uri"])
OPSMIND_TEST_PROCESS_API_URL= PROCESS_API_URL.format(OPSMIND_TEST["host"], OPSMIND_PROD["uri"])
OPSMIND_STAGE_PROCESS_API_URL= PROCESS_API_URL.format(OPSMIND_STAGE["host"], OPSMIND_STAGE["uri"])
OPSMIND_PROD_REGION_DIFF_URL=REGION_DIFF_CONFIG_API_URL.format(OPSMIND_PROD["host"])
OPSMIND_TEST_REGION_DIFF_URL=REGION_DIFF_CONFIG_API_URL.format(OPSMIND_TEST["host"])
OPSMIND_STAGE_REGION_DIFF_URL=REGION_DIFF_CONFIG_API_URL.format(OPSMIND_STAGE["host"])
TIMEOUT=50

def getCMDBConf(env):
    if env == "test":
        return OPSMIND_TEST
    elif env == "stage":
        return OPSMIND_STAGE
    return OPSMIND_PROD

def genBuildConfConfigFromDevDeployConfig(deploy_config):
    # 生成二级配置
    host_process_dict = defaultdict(lambda : [])
    host_process_id_dict = defaultdict(lambda : 0)
    for server_type in all_server_type_list:
        if server_type not in deploy_config:
            continue
        server_config = deploy_config[server_type]['servers']
        for host_config in server_config:
            for host_id in [int(x) for x in host_config['host'].split(',')]: 
                for index in range(int(host_config['num'])):
                    host_str = '.'.join([str(deploy_config['region_id']), str(getServerType(server_type)), str(host_id)])
                    host_process_id_dict[host_str] += 1
                    app_id = host_str + '.' + str(host_process_id_dict[host_str])
                    process = {'app_id': app_id, 'server_type': server_type, 'port_offset': host_process_id_dict[host_str]-1}
                    if 'service_list' in host_config.keys():
                        process['service_list'] = host_config['service_list']
                    host_process_dict[host_id].append(process)

    # 拼接成合适的table 
    build_conf_config = copy.deepcopy(deploy_config)
    server_map = {}
    for server_config in deploy_config['server_list']:
        server_map[server_config['id']] = server_config
    for host_id, process_list in host_process_dict.items():
        for process in process_list:
            process['server'] = server_map[host_id]
            build_conf_config[process['server_type']].setdefault('processes',[]).append(process)
    return build_conf_config

def convert(input):
    if isinstance(input, dict):
        return {convert(key): convert(value) for key, value in input.iteritems()}
    elif isinstance(input, list):
        return [convert(element) for element in input]
    elif isinstance(input, unicode):
        return input.encode('utf-8')
    else:
        return input

def getBuildConfConfig(region_name, env):
    url = OPSMIND_PROD_PROCESS_API_URL
    if env == 'test':
        url = OPSMIND_TEST_PROCESS_API_URL
    elif env == 'stage':
        url = OPSMIND_STAGE_REGION_DIFF_URL
    region_config_url = url + region_name + "&token=" + OPSMIND_TOKEN
    process_deploy_config = requests.get(region_config_url, timeout=TIMEOUT)
    #table = yaml.safe_load(process_deploy_config_json.text)
    table = convert(process_deploy_config.json())
    assert table, "获取二级配置失败，区服名:{0}, opsmind地址:{1}".format(region_name, url)
    return table

def getRegionDiffConf(region_name, env):
    url = OPSMIND_PROD_REGION_DIFF_URL
    if env == 'test':
        url = OPSMIND_TEST_REGION_DIFF_URL
    elif env == 'stage':
        url = OPSMIND_STAGE_REGION_DIFF_URL
    region_config_url = url + region_name + "&token=" + OPSMIND_TOKEN
    region_diff_config = requests.get(region_config_url, timeout=TIMEOUT)
    #table = yaml.safe_load(region_diff_config.text)
    table = convert(region_diff_config.json())
    result = table.get('result', '{}')
    succ = table.get('success', False)
    # 空字典当没有
    succ = succ and len(result) >= 1
    return result, succ

