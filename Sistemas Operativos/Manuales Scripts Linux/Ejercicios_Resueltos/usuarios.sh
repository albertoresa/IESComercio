#!/bin/bash 
clear
if [ ! $1 ] #Si no se ha pasado ningún parámetro lo indica y finaliza
then
	echo -e "\e[0;31mNO HA INTRODUCIDO UN USUARIO. TERMINANDO PROGRAMA\e[0;0m"
	exit
fi

usu=$1
usuario=`grep "$usu:" /etc/passwd`

if [ -n "$usuario" ]
then
	echo -e "\e[0;31mEL USUARIO $1 YA EXISTE \e[0;0m"
else
	#Comprueba si los grupos ya existen o no
	shift #pierdo $1 (usuario) y solo me quedo con los grupos
	for grupo in $@ #En $@ o en $* tendre todos los grupos pasados
	do
		grupos=`grep "$grupo:" /etc/group`
		if [ -z $grupos ]
        	then
                	groupadd $grupo
			echo -e "\e[0;34m Creando grupo $grupo" 
		fi
	done
	#FIN de comprobar grupos
	#Creamos el número de usuarios deseados
	echo -e "\e[0;0m"
	read -p "¿Cuantos usuarios desea crear? " numusu
	echo -e "\n"
	grupos=`echo $* | tr " " ","` # grupos="grupo1,grop2,grop3,....."
	for i in `seq 1 $numusu`
	do
		useradd -m -s /bin/bash $usu$i -G $grupos
		`echo -e "$usu$i\n$usu$i" | passwd $usu$i 2>/dev/null`
		echo -e "\e[0;35m Usuario $usu$i Creado"
	done
fi
echo -e "\e[0;0m"
