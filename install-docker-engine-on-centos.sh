#!/bin/sh

# Install Docker Engine on CentOS

## install containerd.io:latest
URL='https://mirrors.aliyun.com/docker-ce/linux/centos/7/x86_64/stable/Packages/'
A=$(curl $URL | grep containerd.io | cut -d '>' -f 2 | cut -d '<' -f 1)
B=$(echo $A | sed 's/ /\n/g' | cut -d '-' -f 2 | sort -t '.' -n -k 1,1 -k 2,2 -k 3,3 | tail -1)
C=$(echo $A | sed 's/ /\n/g' | grep $B)
D=$(echo $C | sed 's/ /\n/g' | cut -d '-' -f 3 | sort -t '.' -n -k 1,1 -k 2,2 | tail -1)
E=$(echo $C | sed 's/ /\n/g' | grep $D)
sudo yum install -y $URL$E

## install docker-ce:latest
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh --mirror Aliyun

## mirror
sudo tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": [
        "https://hub-mirror.c.163.com/"
    ]
}
EOF

