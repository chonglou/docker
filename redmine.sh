#!/bin/sh

hash docker &>/dev/null || {
	type yum >/dev/null 2>&1 && yum -y install docker
	type apt-get >/dev/null 2>&1 && apt-get -y install docker
}

type docker >/dev/null 2>&1 || {
	echo 'Unknown linux distribution'
	exit 1
}
docker run -p 443:443 -P –privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro chonglou/redmine:latest /sbin/init
