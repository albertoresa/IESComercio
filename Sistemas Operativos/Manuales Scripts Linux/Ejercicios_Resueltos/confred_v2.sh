#! /bin/bash
clear
read -p "Introduce el nombre de la tarjeta a configurar: " red
existe=`ifconfig -a | grep "$red:"`
if [ -n "$existe" ]
then
	echo -e "\n \e[0;34m"
	read -p "Introduce la IP a asignar: " ip
	read -p "Introduce la Máscara a asignar: " mascara
	read -p "Introduce la Puerta de enlace: " pe
	read -p "Introduce el primer DNS: " dns1
	if [ -n "$dns1" ] 
	then
		dns1="nameserver $dns1"
	fi
	read -p "Introduce el segundo DNS: " dns2
	if [ -n "$dns2" ] 
	then
		dns2="nameserver $dns2"
	fi
	ifconfig $red $ip netmask $mascara 2>/dev/null
	if [ $? = 0 ]
	then
		`route del default 2>/dev/null;route add default gw $pe 2>/dev/null`
		if [ $? = 0 ]
		then
			echo "$dns1" > /etc/resolv.conf
			echo "$dns2" >> /etc/resolv.conf
		       	echo -e "\n\e[0;31mLA TARJETA DE RED $red HA SIDO CONFIGURADA\e[0;0m"
		else
			echo -e "\n\e[0;31mSE HA PRODUCIDO UN ERROR AL CONFIGURAR $red.REVISE EL VALOR INTRODUCIDO COMO PUERTA DE ENLACE\e[0;0m"
		fi
	else
		echo -e "\n\e[0;31mSE HA PRODUCIDO UN ERROR AL CONFIGURAR $red.REVISE LOS VALORES INTRODUCIDOS EN LA IP/MÁSCARA\e[0;0m"
	fi
else
	echo -e "\e[0;31mLA TARJETA DE RED $red NO EXISTE\e[0;0m"
fi
