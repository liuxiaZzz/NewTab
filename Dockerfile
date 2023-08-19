FROM centos:centos7
MAINTAINER Junbin Gao

# install web server
RUN yum install -y httpd php mysql mysql-server

#TODO config mysql to support login

# expose tcp:80 port
EXPOSE 80

# start apache
CMD /usr/sbin/httpd -D FOREGROUND
