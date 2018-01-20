#! /bin/bash
clear

#Guarda en el vector tarjetas todos los nombres de todas las tarjetas
tarjetas=(`ip addr show | grep "[0-9]: " | cut -d ":" -f2`)
color=30 #Esta variable se usa solo para cambiar de color cada tarjeta

for tarj in ${tarjetas[@]}
do
   ip=`ip addr list $tarj | grep -w inet | sed 's/^ *//g' | cut -d " " -f2 | cut -d "/" -f1`
   if [ -z "$ip" ]
   then
	ips="No configurada"
   else
	ips="$ip"
   fi
   echo -e "\e[0;"$color"m tarjeta:$tarj IP:$ips \n"
   let color=$color+1 # la orden let realiza operaciones aritméticas
done
echo -e "\e[0;0m"
