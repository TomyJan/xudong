import yaml
import os
import sys

def merge_dict(src,dst):
    if(src == None):
        return
    for key,val in src.items():
        if key not in dst:
            dst[key] = val
        else:
            if type(src[key]) != type(dst[key]):
                return
            if isinstance(dst[key],dict):
                merge_dict(src[key],dst[key])

def get_yaml_data(yaml_file):
    file_data = None
    with open(yaml_file, 'r', encoding="utf-8") as file:
        file_data = file.read()
    data = yaml.safe_load(file_data)
    return data

def judge_redis_data():
    redis_map = {}
    CONFIG_DIR=os.path.join(sys.path[0], "../conf/dev/")
    common_item = None
    try:
        common_item = get_yaml_data(os.path.join(CONFIG_DIR,"dev_common.yaml"))["redis"]
    except:
        print("读取配置dev_common.yaml时发生错误")
    directory = os.walk(CONFIG_DIR, False)
    conflict_judge = False
    if len(sys.argv) == 2:
        try:
            print(os.path.join(CONFIG_DIR,sys.argv[1] + ".yaml"))
            redis_item = get_yaml_data(os.path.join(CONFIG_DIR,sys.argv[1] + ".yaml"))["redis"]
            merge_dict(common_item,redis_item)
            redis_str = str(redis_item)
            redis_map[redis_str] = [sys.argv[1]]
        except:
            print("读取配置%s时发生错误"% sys.argv[1])
            return 1
    for files in directory:
        for file in files[2]:
            if len(sys.argv) == 2 and sys.argv[1] == file[:-5]:
                continue
            if file.endswith(".yaml") and file != "dev_common.yaml":
                redis_item = None
                try:
                    redis_item = get_yaml_data(os.path.join(files[0],file))["redis"]
                except:
                    print("读取配置%s时发生错误" % file)
                    continue
                merge_dict(common_item,redis_item)
                redis_str = str(redis_item)
                if redis_str in redis_map:          
                    conflict_judge = True
                    redis_map[redis_str].append(file)
                else:
                    if len(sys.argv) == 2:
                        continue
                    redis_map[redis_str]=[file]
    if not conflict_judge:
        return 0
    
    print("\033[1;33m redis 配置冲突,冲突文件为: \033[0m")
    for key,val in redis_map.items():
        if len(val) >= 2:
            print("\033[1;33m 冲突文件:\033[0m", end=" ")
            for file in val:
                print(file,end=" ")
            print()
    return 1
                
def main():
    sys.exit(judge_redis_data())
   
if __name__ == "__main__":
    main()