#################################################################
# monitora a bateria de um laptop no debian. fique atento ao nome
# da bateria presente no sistema, para saber, dê um ls na pasta "/sys/class/power_supply/".
# Usado como referência: https://www.kernel.org/doc/Documentation/power/power_supply_class.txt
#################################################################

#!/bin/bash


bat="BAT1"     #bateria a ser monitorada
intervalo=5;   #intervalo de atualizacao em segundos
charge="Charging" #indicacao do estado para comparacao


 while : ; do


   clear;
   echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' ;
   echo ''
   echo 'Monitorando a Bateria:' $bat ;
   echo ''

   carga=$( cat /sys/class/power_supply/BAT1/status  | grep mAh | cut -c26-29) ;
   capacidade=$(cat /sys/class/power_supply/BAT1/capacity);
#  capacidade=15
   estado=$(cat /sys/class/power_supply/BAT1/status);

   if [ $capacidade -le '20' ];
   then
      capacidade=$(echo -e '\033[01;31m'$capacidade'\033[0m')
   else
     capacidade=$(echo -e '\033[01;32m'$capacidade'\033[0m')
   fi;

   echo -e '\033[01;37mCarga:\033[0m' $carga 'mAh' ;
   echo -e '\033[01;37mCapacidade: \033[0m'$capacidade '%';
   echo -ne '\033[01;37mEstado: \033[0m'

   if [ $estado == $charge ];
   then
      echo -ne "carregando"
      echo ''
   else
      echo -ne "descarregando"
      echo ''
   fi;

   echo ''
   echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' ;

   sleep $intervalo;
 done;

done;
