bin=$1 # 参数1 bin文件路径
patch=$2 #参数2 patch文件路径

MIN_FUNC_LENGTH=16

if [ ! -f ${bin} ] 
then
echo "bin：${bin} not exist"
exit 1
fi

if [ ! -f ${patch} ] 
then
echo "patch:${patch} not exist"
exit 1
fi


## 校验rely_version

bin_rely_version=`./${bin} -v | grep rely_version | awk '{print $2}'`
result=$(echo ${patch} | grep "${bin_rely_version}")

if [[ "${result}" == "" ]] 
then
echo "rely_version not same, bin:${bin_rely_version}, patch:${patch}"
exit 1
fi




## 校验短函数
isShortFunc(){
    sign=$1
    start_addr=$(nm -n ${bin} | grep "\w\s${sign}" | awk '{print "0x"$1;exit}') 
    end_addr=$(nm -n ${bin} | grep -A1 "\w\s${sign}" | awk '{getline; print "0x"$1;exit}')
    #转换成10进制
    start_addr=$((${start_addr}))
    end_addr=$((${end_addr}))
    func_size=`expr ${end_addr} - ${start_addr}`
    if [ ${func_size} -lt ${MIN_FUNC_LENGTH} ]
    then
        func_name=`c++filt ${sign}`
        echo "${func_name} too short, size:${func_size}, min_func_size:${MIN_FUNC_LENGTH}"
        exit 1
    fi
} 

func_table=`readelf -p FUNC_TABLE_SECTION ${patch} | grep "\[" | awk '{print $NF}'`
for func in ${func_table}
do
    isShortFunc $func
done

exit 0



