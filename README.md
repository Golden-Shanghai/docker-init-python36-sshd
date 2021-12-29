# 全自动创建pyhon3.6容器镜像(支持ssh)
> Author: Zyz (zed.zhao@goldentec.com)   
> At: 2021-12-28
- 包含sshd服务
- 每次start服务会自动执行pip install

## 使用方式
```shell
# 先进入Dockerfile所在目录
# cd ......

# 进入Dockerfile修改root账户密码（若需要）
vi Dockerfile

# 进入docker-compose设置好目录映射（若需要）
vi docker-compose.yml

# 修改启动初始化需要执行的命令（若需要）
vi sh/init.sh

# 运行自动构建脚本
./sh/auto_build.sh

# 完毕后查看docker容器运行情况
docker ps
```

## 常用命令
```shell
# 进入容器
docker exec -it python36gd /bin/bash

# 退出容器
exit

# 通过docker-compose停止容器，需要先进入docker-compse所在路径
# cd ......
docker-compose down

# 启动容器
docker-compose up

# 静默启动容器
docker-compose up -d

# 重新手动构建镜像，不启动，需要先进入Dockerfile所在路径
docker build -t python:36gd .
```