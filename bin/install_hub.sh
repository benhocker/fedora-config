#!/bin/bash

url='https://github.com/github/hub/releases/download/v2.2.0-preview1/hub_2.2.0-preview1_linux_amd64.gz.tar'
filename=`echo $url | awk -F/ '{print $NF}'`


cd /tmp
wget $url
tar zxvf $filename

sudo ln -s /tmp/hub_2.2.0-preview1_linux_amd64/hub /usr/local/bin/hub
