FROM centos:8
MAINTAINER thegeek72
LABEL Remarks="CentOS 8 with openssh-server"
RUN yum -y update && yum -y install openssh-server openssh-clients lsof nmap-ncat git
RUN yum -y clean all
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
COPY src/sshd/sshd_config /etc/ssh/sshd_config 
COPY src/.bashrc /root/ 
RUN echo root:welcome1 | chpasswd
EXPOSE 22
ENV HOME /root
WORKDIR /root
CMD /usr/sbin/sshd -D
