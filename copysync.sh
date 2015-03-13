#!/bin/bash

#/opt/copy/x86_64/CopyAgent &

export LC_ALL=C
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

rsync -Crazp --delete  /root/scripts/ /home/luiz/Copy/scripts-casa
rsync -Crazp --delete  /root/data/ /home/luiz/Copy/data

#$sync

#ps aux |grep copy > copy.pid
#copy=( $(awk '{print $2}' copy.pid) )

#kill -9  $copy

