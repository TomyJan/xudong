patch=$1 #参数2 patch文件路径

if [ ! -f ${patch} ] 
then
echo "patch:${patch} not exist"
fi

total_func_size=0


## 校验签名是否完全一致
isFuncExist(){
    sign=$1
    rel_sign=`nm -D ${patch} | grep ${sign} |awk '{print $NF}'`
   
    if [ "${sign}" != "${rel_sign}" ]
    then
        echo -e "\033[31m ERROR:${sign} CHECK FAILED \033[0m so sign:${rel_sign}"
    else
        func_name=`c++filt ${rel_sign}`
        echo -e "\033[32m ${func_name} CHECK SUCC \033[0m"
    fi
} 

func_table=`readelf -p FUNC_TABLE_SECTION ${patch} | grep "\[" | awk '{print $NF}'`
for func in ${func_table}
do
    total_func_size=`expr ${total_func_size} + 1`  
    isFuncExist $func
done

if [ ${total_func_size} = 0 ]
then
    echo -e "\033[31m ERROR:meta function table is empty \033[0m"
fi
