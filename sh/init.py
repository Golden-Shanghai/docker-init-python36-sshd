#!/usr/bin/env python
# -*- encoding: utf-8 -*-
'''
@File    :init.py
@Desc    :容器启动初始化脚本
@Time    :2022/01/05 11:15:28
@Author    :zed.zhao
@Vesion    :1.0
'''
import pathlib
import os


# 依赖管理文件位置
requirementsPath = '/home/wwwroot/cx_bigdata_dts/requirements.txt'

cmd = 'pip3.6 install --upgrade pip'

# 判断是依赖管理文件是否存在

path = pathlib.Path(requirementsPath)

if path.exists():
    cmd = cmd + '''&& pip3.6 install wheel \
                   && pip3.6 install cryptography \
                   && pip3.6 install setuptools-rust \
                   && pip3.6 install -i https://mirrors.aliyun.com/pypi/simple/ -r ''' + requirementsPath + '''\
                       '''

os.system(cmd)

os.system('kinit -kt /etc/security/hive.keytab hive')

# 启动sshd服务
os.system('/usr/sbin/sshd && /usr/sbin/sshd -D')

# 执行结束返回bash，防止0进程exit
os.system('/bin/bash')
