
#!/bin/bash
sudo yum update -y
sudo yum install -y wget git mysql-client tree nfs-utils mysql python2-cryptography sshpass  
sudo yum-config-manager --enable "Red Hat Enterprise Linux Server 7 Extra(RPMs)"

#Install Ansible: install Epel repo and install Ansible from Epel
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install ansible
sudo yum -y remove ansible #remove the newest version to install the version 2.6

wget https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.6.0-1.el7.ans.noarch.rpm
sudo rpm -ivh ansible-2.6.0-1.el7.ans.noarch.rpm
# -	Install Redis-cli: this tool will use for checking the Redis instances
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable

sudo yum install -y gcc
cd deps
make hiredis jemalloc linenoise lua geohash-int
cd ..
make redis-cli
sudo cp src/redis-cli /usr/local/bin/