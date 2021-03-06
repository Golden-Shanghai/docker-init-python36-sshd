# 继承镜像python3.6.15
FROM docker.io/python:3.6.15

# 作者信息
MAINTAINER from zyz

# 镜像的操作指令
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh
# 取消pam登录失败次数限制
RUN sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd

# 需要修改root密码，请放开注释
# RUN echo "root:123456789" | chpasswd

# 若需要新增用户，请放开注释
RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "admin  ALL=(ALL)    ALL" >> /etc/sudoers

RUN apt-get update
# 装sals 
RUN apt-get install -y sasl2-bin
RUN apt install libsasl2-modules-gssapi-heimdal
RUN apt-get install -y python-dev libsasl2-dev gcc
# 装kerberos
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y krb5-user libpam-krb5

# 开放端口[ssh]
EXPOSE 22

