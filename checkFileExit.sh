#!/bin/bash

if [ $# != 1 ]
then
    # 不是一个参数
    echo "该脚本需要一个文件名参数"
else
    if [ -e $1 ]
    then
        echo "$1文件存在"
        # 文件存在可进行下一步操作，删除之类的
        # rm ./$1
    else
        echo "$1文件不存在"
    fi
fi
