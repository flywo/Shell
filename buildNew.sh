#!/bin/bash
# 指定运行的shell

# 判断是否只有一个参数
if [ $# != 1 ]
then
    # 不是一个参数
    echo "该脚本需要一个文件名参数"
else
    # 只有一个参数，创建出文件
    touch $1.sh
    # 写入shell路径
    echo '#!/bin/bash' > $1.sh
    # 赋予执行权限
    chmod 764 $1.sh
    # -e 表示使用转义
    echo -e "创建新的脚本文件成功:\n$(pwd)/$1.sh"
fi
