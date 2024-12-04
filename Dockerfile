FROM centos:centos7
MAINTAINER Shibo

# 替换为阿里云镜像源以解决 yum 失败问题
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://mirrors.aliyun.com|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && yum makecache

# 安装 HTTPD、PHP 和 MySQL
RUN yum install -y httpd php mariadb-server && yum clean all

# 暴露 80 端口
EXPOSE 80

# 启动 Apache 服务
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
