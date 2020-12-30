FROM centos:8
MAINTAINER thegeek72
LABEL Remarks="CentOS 8 with PDNS Auth server v44 release,using an sqlite backend, api enabled"

RUN yum -y update && yum -y install epel-release wget curl jq
RUN wget -O /etc/yum.repos.d/powerdns-auth-44.repo https://repo.powerdns.com/repo-files/centos-auth-44.repo
RUN yum -y clean all && yum -y install sqlite pdns pdns-backend-sqlite && rm -f /etc/pdns/pdns.conf

COPY src/.bashrc /root/.bashrc
COPY src/etc/pdns/pdns.conf /etc/pdns/pdns.conf
COPY src/etc/pdns/example.com.db /etc/pdns/example.com.db
COPY src/root/import_example.com.sh /root/import_example.com.sh
COPY src/etc/pdns/schema.sqlite3.sql.template /sqlite/schema.sqlite3.sql

RUN mkdir -p /sqlite && touch /sqlite/db.sqlite && chown -R pdns: /sqlite && chmod -R 700 /sqlite && sqlite3 /sqlite/db.sqlite < /sqlite/schema.sqlite3.sql
RUN /root/import_example.com.sh

EXPOSE 53
ENV HOME /root
WORKDIR /root
CMD pdns_server
