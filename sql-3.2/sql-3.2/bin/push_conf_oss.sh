#!/bin/bash
# 上传配置到文件oss

#$1 region name

TIME=`date '+%Y%m%d%H'`
oss_path="oss://hk4e-config/$1/$TIME/"

#上传目录到oss
cp run ./output
tar zcf output-$TIME.tgz ./output
ossutil cp -f output-$TIME.tgz $oss_path
