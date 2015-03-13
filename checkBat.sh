#######################################
#  Medidor de carga da Bateria
#
# Descricaoo: Monitora o  estatus da bateria e a sua carga.
#         Trabalha em loop infinito, para sair tecle control-c
#
# Entradas: Nenhuma
# Saidas: Monitor de carga na saida padrao
#
# autor: Evaldo Avelar Marques agosto - 2009
# versao: 1.0
#
#######################################
 
#!/bin/bash
 
 
bat="BAT0"     #bateria a ser monitorada
intervalo=5;   #intervalo de atualizacao em segundos
 
 
 while : ; do
  
 
   clear;
   echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' ;
   echo ''
   echo 'Monitorando a Bateria:' $bat ;
   echo ''
 
   carga=$( cat /proc/acpi/battery/$bat/state  | grep mAh | cut -c26-29) ;
   capacidade=$(cat /proc/acpi/battery/$bat/info  | grep full | cut -c26-29);
   estado=$(cat /proc/acpi/battery/$bat/state  | grep charging | cut -c26-39);
 
   echo 'Carga:' $carga 'mAh' ;
   echo 'Capacidade: '$capacidade 'mAh';
   echo -n 'Estado: '
    
   if [ $estado = "charging" ] ;
   then
      echo -n "Carregando"
   else
      echo -n "Descarregando"   
   fi;
 
   echo ''
 
   # Calculo do percentual da bateria
   p=$(( $carga * 100 ));
   p=$(( $p / $capacidade )) ;
 
   echo '';
   echo '      ' $p '%' ;
 
   cont=$(( $p / 10 ));
    
   echo -n "0% "
   for (( i=0 ; i < 10 ; i++ ))
   do
           if [[ $i -lt $cont ]];
          then
         echo -n  "="
          else
         echo  -n "-"               
         fi;   
   done;
   echo -n " 100%"
 
   echo ''
   echo ''
    
   echo 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' ;
   sleep $intervalo;
 done;
