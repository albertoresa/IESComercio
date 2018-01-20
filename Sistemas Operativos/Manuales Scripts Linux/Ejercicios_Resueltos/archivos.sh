#! /bin/bash
clear
read -p  "Introduzca ruta y archivo origen " origen
if [ ! -d $origen ]
then
	if [ -e $origen ]
	then
		echo "1.- Copiar Archivo"
		echo "2.- Borrar Archivo"
		echo -e "3.- Mover Archivo \n"
		read -n1 -p "Seleccione una opción: " opcion
		echo -e "\n"
		case $opcion in
		1)
	   	read -p  "Introduzca ruta y archivo destino " destino
		cp $origen $destino 2>/dev/null
		if [ $? = 0 ]
		then
			echo -e "\e[0;31mARCHIVO COPIADO\e[0;0m"
		else
			echo -e "\e[0;31mEL ARCHIVO NO SE HA PODIDO COPIAR\e[0;0m"
		fi
		;;	
		2)
           	rm $origen 2>/dev/null
		if [ $? = 0 ]
		then
		   	echo -e "\e[0;31mARCHIVO BORRADO\e[0;0m" 
		else
			echo -e "\e[0;31mEL ARCHIVO NO SE HA PODIDO BORRAR\e[0;0m"
		fi
		;;
		3)
           	read -p  "Introduzca ruta y archivo destino " destino
           	mv $origen $destino 2>/dev/null
	   	if [ $? = 0 ]
		then
			echo -e "\e[0;31mARCHIVO MOVIDO\e[0;0m"
else
			echo -e "\e[0;31mEL ARCHIVO NO SE HA PODIDO MOVER\e[0;0m"
		fi
		;;
		esac
	else
		echo -e "\e[0;31mEL ARCHIVO INTRODUCIDO NO EXISTE\e[0;0m"
	fi
else
	echo -e "\e[0;31mHA INTRODUCIDO UN DIRECTORIO\e[0;0m"
fi
