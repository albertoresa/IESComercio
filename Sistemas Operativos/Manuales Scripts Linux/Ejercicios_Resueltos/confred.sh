#! /bin/bash
clear
read -p "Introduce el nombre de la tarjeta a configurar: " red
existe=`ifconfig -a | grep "$red:"`
if [ -n "$existe" ]
then
	echo -e "\n \e[0;34m"
	read -p "Introduce la IP a asignar: " ip
	read -p "Introduce la Máscara a asignar: " mascara
	ifconfig $red $ip netmask $mascara 2>/dev/null
	if [ $? = 0 ]
	then
		echo -e "\n\e[0;31mLA TARJETA DE RED $red HA SIDO CONFIGURADA\e[0;0m"
		ifconfig $red
	else
		echo -e "\n\e[0;31mSE HA PRODUCIDO UN ERROR AL CONFIGURAR $red.REVISE LOS VALORES INTRODUCIDOS\e[0;0m"
	fi
else
	echo -e "\e[0;31mLA TARJETA DE RED $red NO EXISTE\e[0;0m"
fi
