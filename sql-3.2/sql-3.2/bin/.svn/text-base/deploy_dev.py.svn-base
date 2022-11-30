#!/usr/bin/python2
#-*- coding: utf8 -*-

import os
import sys
import traceback
import subprocess
from build_conf import *
from common import server_type_list


def usage():
    print("usage:")
    print("\t%s <region_name> <output_dir>" % sys.argv[0])


def main():
    if len(sys.argv) < 2:
        usage()
        return
    region_name = sys.argv[1]
    table, _ = read_yaml_files(region_name, 'dev')
    # step 1. parse directory of region
    deploy_dir = os.path.join(os.getcwd(), 'env')

    # step 2. create bin lib and conf directory
    output_path = os.path.join(deploy_dir, 'output')
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # step 3. copy bin and lib
    subprocess.call(['sh', '+x', './tools/op_tools/bin/deploy_dev_copy_bin.sh', output_path])
    print "copy succ"

    # step 4. build_conf
    subprocess.call(['python', './tools/op_tools/bin/build_conf.py', region_name, 'dev', output_path])
    print "build_conf succ"

    # step 5. create directory and create symbol link
    for server in server_type_list:
        for process in table[server]['processes']:
            dir_name = server + '_' + str(process['app_id'])
            dir_path = os.path.join(deploy_dir, dir_name)
            log_path = os.path.join(dir_path, 'log')
            conf_path = os.path.join(dir_path, 'conf')
            for path in [log_path, conf_path]:
                if not os.path.exists(path):
                    os.makedirs(path)
            bin_symlink = os.path.join(dir_path, server)
            bin_source = os.path.join(output_path, server + '/' + server)
            if not os.path.exists(bin_symlink):
                if os.path.lexists(bin_symlink):
                    os.unlink(bin_symlink)
                os.symlink(bin_source, bin_symlink)
            run_symlink = os.path.join(dir_path, 'run')
            run_source = os.path.join(output_path, server + '/run')
            if not os.path.exists(run_symlink):
                if os.path.lexists(run_symlink):
                    os.unlink(run_symlink)
                os.symlink(run_source, run_symlink)
            conf_symlink = os.path.join(dir_path, 'conf/' + server + '.xml')
            conf_source = os.path.join(output_path, server + '/conf/' + server + '.xml')
            if not os.path.exists(conf_symlink):
                if os.path.lexists(conf_symlink):
                    os.unlink(conf_symlink)
                os.symlink(conf_source, conf_symlink)

    # step 6. create robot directory and create symbol link
    server = 'robot'
    dir_path = os.path.join(deploy_dir, server)
    log_path = os.path.join(dir_path, 'log')
    conf_path = os.path.join(dir_path, 'conf')
    for path in [log_path, conf_path]:
            if not os.path.exists(path):
                os.makedirs(path)
    bin_symlink = os.path.join(dir_path, server)
    bin_source = os.path.join(output_path, server + '/' + server)
    if not os.path.exists(bin_symlink):
        if os.path.lexists(bin_symlink):
            os.unlink(bin_symlink)
        os.symlink(bin_source, bin_symlink)
    lib_symlink = os.path.join(dir_path, 'lib')
    lib_source = os.path.join(output_path, 'lib')
    if not os.path.exists(lib_symlink):
        if os.path.lexists(lib_symlink):
            os.unlink(lib_symlink)
        os.symlink(lib_source, lib_symlink)
    lua_symlink = os.path.join(dir_path, 'lua')
    lua_source = os.path.join(output_path, server + '/lua')
    if not os.path.exists(lua_symlink):
        if os.path.lexists(lua_symlink):
            os.unlink(lua_symlink)
        os.symlink(lua_source, lua_symlink)
 
 
    # step 7. deploy gacha_simulate





if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print e
        print traceback.print_exc()
        exit(-1)
