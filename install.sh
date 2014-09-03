#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: ./install.sh PKG_NAME"
	exit 1
fi

echo "Will install $1"

hash docker &>/dev/null || {
	type yum >/dev/null 2>&1 && { 
		sudo yum -y install docker
		sudo service docker start
		sudo chkconfig docker on
	}
	type apt-get >/dev/null 2>&1 && { 
		sudo apt-get -y install docker
	}
}

type docker >/dev/null 2>&1 || {
	echo 'Unknown linux distribution'
	exit 1
}
sudo docker pull chonglou/$1:latest
sudo docker run -d -p 443:443 -p 80:80 -P --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro chonglou/$1:latest /sbin/init
