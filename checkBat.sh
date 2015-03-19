#!/usr/bin/env bash

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

bat="BAT1"     #bateria a ser monitorada
intervalo=5;   #intervalo de atualizacao em segundos
charge="Charging" #indicacao do estado para comparacao
GREEN="\033[01;32m"
RED="\033[01;31m"
WHITE="\033[01;37m"
NONE="\033[0m"
YELLOW="\033[01;33m"

 while true ; do


   clear;
   echo ''
   echo -e ''$WHITE'Monitorando a Bateria:'$NONE':' $bat;
   echo ''

   #carga=$(cat /sys/class/power_supply/BAT1/power_now) ;
   #carga_full=$(cat /sys/class/power_supply/BAT1/energy_full);
   #capacidade=$(cat /sys/class/power_supply/BAT1/capacity);
   #estado=$(cat /sys/class/power_supply/BAT1/status);
   carga=3213213213
   carga_full=1000000000
   capacidade=$(cat /home/lmoura/capacidade)
   estado='Charging'

   if [ $capacidade -lt '5' ]; then
      capacidade=$(echo -e ''$RED''$capacidade''$NONE'')
      AVISO='conecte na fonte, bateria em estado crítico'
   elif [ $capacidade -lt '10' ]; then
     capacidade=$(echo -e ''$RED''$capacidade''$NONE'')
     AVISO=''
   elif [ $capacidade -lt '20' ]; then
     capacidade=$(echo -e ''$YELLOW''$capacidade''$NONE'')
     AVISO=''
   else
     capacidade=$(echo -e ''$GREEN''$capacidade''$NONE'')
     AVISO=''
   fi;

   echo -e ''$WHITE'Carga total:'$NONE' '$carga_full' mAh'
   echo -e ''$WHITE'Carga atual:'$NONE'' $carga 'mAh';
   echo -e ''$WHITE'Capacidade: '$NONE''$capacidade '%';
   echo -ne ''$WHITE'Estado: '$NONE''

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

   echo -e ''$RED''$AVISO''$NONE''

   sleep $intervalo;
 done;

done;
