#! /bin/bash
clear
#Busca las direcciones IP configuradas
ips=(`ifconfig -a | grep -w "inet" | sed 's/^ *//g' | cut -d " " -f2`)
if [ ${ips[0]} ]
then	
	echo -e "Las ips configuradas en el equipo son: ${ips[*]}"
else
	echo -e "No hay ninguna ip configurada en el equipo."
fi

#Busca la puerta de enlace configurada
pe=(`route -n | grep UG | cut -d " " -f 10`)
if [ ${pe[0]} ]
then
	echo -e "\n\e[0;34mLa/s puerta/s de enlace es/son: ${pe[*]}"
else
	echo -e "\n\e[0;34mNo se ha configurado puerta de enlace."
fi

#Busca los dns configurados
dns=(`cat /etc/resolv.conf 2>/dev/null| grep nameserver | cut -d " " -f2`)
if [ ${dns[0]} ]
then
	echo -e "\n\e[0;33mLo/s servidor/es dns es/son: ${dns[*]}\e[0;0m"
else
	echo -e "No se han configurado servidores DNS\e[0;0m"
fi
