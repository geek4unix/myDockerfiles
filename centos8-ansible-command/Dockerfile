FROM centos:8
MAINTAINER thegeek72
LABEL Remarks="CentOS 8 with python3 and latest ansible"
RUN yum -y update && yum -y install python3 python3-devel gcc krb5-devel krb5-server
RUN yum -y clean all
ENV HOME /root
WORKDIR /root
RUN python3 -m pip install --upgrade pip && \
  python3 -m pip install --upgrade virtualenv && \
  python3 -m pip install pywinrm[kerberos] && \
  python3 -m pip install pywinrm && \
  python3 -m pip install ansible
