#! /bin/bash
clear
tarjetas=(`ifconfig | grep "ens" | cut -d":" -f1`)
echo -e "Hay ${#tarjetas[@]} tarjetas configuradas: ${tarjetas[*]}"
