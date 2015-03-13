#!/bin/bash

#Script que copia o site para o servidor apache

export LC_ALL=C
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

ping -c2 apache > /dev/null
STAT=`echo $?`

if [ "$STAT" -eq "0" ]
 then
	/usr/bin/rsync -Crazp --delete  /home/lmoura/dev/agop/git-ita/itawegman/www/ /tmp/itawegman/ 
	/usr/bin/sudo /bin/chown -R www-data. /tmp/itawegman/
	/usr/bin/rsync -Crazp --delete  /tmp/itawegman/ root@apache:/var/www/itawegman/
	#ssh apache | /etc/init.d/apache2 restart
	echo "Enviado para o servidor."
	/usr/bin/logger "[`date`] - Transferindo para o servidor apache (192.168.122.210)"

 else
	echo "Não foi possível conectar ao servidor"
  	/usr/bin/logger "Não foi possível conectar ao servidor"

fi

