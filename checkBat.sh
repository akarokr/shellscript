################################################################################################
# monitora a bateria de um laptop no debian. fique atento ao nome da bateria presente no sistema,                            #
# para saber, dê um ls na pasta "/sys/class/power_supply/".
# Usado como referência: https://www.kernel.org/doc/Documentation/power/power_supply_class.txt
# espeak -vpt+whisper -s 140 "vou te matar" ---> espeak, programa para sintetizar a voz
################################################################################################


#beepFunc=$(beep; beep; beep)

function beepFun(){
  c=1
    while [ $c -le 5 ]; do
        #Cbeep
        (( c++ ))
    done;
}


#!/bin/bash


bat="BAT1"     #bateria a ser monitorada
intervalo=5;   #intervalo de atualizacao em segundos
charge="Charging" #indicacao do estado para comparacao

 while : ; do


   clear;
   echo ''
   echo -e '\033[01;37mMonitorando a Bateria:\033[0m:' $bat;
   echo ''

   carga=$(cat /sys/class/power_supply/BAT1/power_now) ;
   carga_full=$(cat /sys/class/power_supply/BAT1/energy_full);
   capacidade=$(cat /sys/class/power_supply/BAT1/capacity);
   estado=$(cat /sys/class/power_supply/BAT1/status);

   if [ $capacidade -lt '5' ]; then
      capacidade=$(echo -e '\033[05;31m'$capacidade'\033[0m')
      AVISO='conecte na fonte, bateria em estado crítico'
      beep
   elif [ $capacidade -lt '10' ]; then
     capacidade=$(echo -e '\033[01;31m'$capacidade'\033[0m')
     AVISO=''
   elif [ $capacidade -lt '20' ]; then
     capacidade=$(echo -e '\033[01;33m'$capacidade'\033[0m')
     AVISO=''
   else
     capacidade=$(echo -e '\033[01;32m'$capacidade'\033[0m')
     AVISO=''
   fi;

   echo -e '\033[01;37mCarga total:\033[0m '$carga_full' mAh'
   echo -e '\033[01;37mCarga atual:\033[0m' $carga 'mAh';
   echo -e '\033[01;37mCapacidade: \033[0m'$capacidade '%';
   echo -ne '\033[01;37mEstado: \033[0m'

   if [ $estado == $charge ]; then
      echo -ne "carregando."
      echo ''
   elif [ $estado == "Full" ]; then
      echo -ne "totalmente carregada."
   else
      echo -ne "descarregando."
      echo ''
   fi;

   echo ''

   echo -e '\033[1;5;31m'$AVISO'\033[0m'

   sleep $intervalo;
 done;

done;
