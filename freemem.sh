#!/bin/bash

FREE=`free -m | awk  'NR==2 {print $4}'`
PARAM="600"

if [  $FREE -lt  $PARAM ]
then
  echo 3 > /proc/sys/vm/drop_caches
else
fi

