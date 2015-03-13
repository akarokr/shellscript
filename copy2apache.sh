#!/bin/bash

# Program to copy files to a remote server. You just need to setup the server IP and the users.  

export LC_ALL=C
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

# Set users and IP
USER =
SERVER_USER = 
IP =

# Set the folders
LOCAL_FOLDER = 
TMP_FOLDER = 
SERVER_FOLDER = 

mkdir $TMP_FOLDER
ping -c2 $IP > /dev/null
STAT=`echo $?`i

if [ "$STAT" -eq "0" ]
 then
	/usr/bin/rsync -Crazp --delete  $LOCAL_FOLDER $TMP_FOLDER
	/usr/bin/sudo /bin/chown -R $SERVER_USER $TMP_FOLDER
	/usr/bin/rsync -Crazp --delete  $TMP_FOLDER $USER@$IP:$SERVER_FOLDER
	#ssh apache | /etc/init.d/apache2 restart
	#echo "Sending to server"
	/usr/bin/logger "[`date`] - Sending to the server $IP"

 else
	#echo "Unable to connect to the server"
  	/usr/bin/logger "The script was unable to connect to the server. Mission aborted."

fi

