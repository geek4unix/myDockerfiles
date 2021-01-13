FROM centos:8 with python3 krb5 and ansible

build:  docker build -t "thegeek72/centos8-ansible-command" .

run:  docker run -it "thegeek72/centos8-ansible-command" /bin/bash

example:


centos8-docker-command % docker run -it "thegeek72/centos8-ansible-command" /bin/bash
[root@92eadf94e090 ~]# ansible --version
ansible 2.10.4
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.6/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.6.8 (default, Aug 24 2020, 17:57:11) [GCC 8.3.1 20191121 (Red Hat 8.3.1-5)]
