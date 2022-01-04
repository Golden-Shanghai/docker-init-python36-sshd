#!/bin/bash

requirements_path="/home/wwwroot/cx_bigdata_dts/requirements.txt"

cmd="pip install --upgrade pip"

# 判断是否存在依赖管理文件
if [ -d ${requirements_path} ];then
    # 存在，则通过管理文件跑依赖
    $cmd=${$cmd}"&& pip install -i https://mirrors.aliyun.com/pypi/simple/ -r "${requirements_path}
fi

eval ${cmd}

# 启动sshd服务
eval "/usr/sbin/sshd && /usr/sbin/sshd -D"

# 执行结束返回bash，防止0进程exit
eval "/bin/bash"