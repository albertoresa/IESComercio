#!/bin/bash
# script de copia completa e incremental
# modificar directorios a respaldar y destino del Backup
DIRECTORIOS="/home/Descargas"
# directorio donde se guarda el backup
BACKUPDIR=/home/Backups
# directorio que guarda la fecha del último backup completo
FECHADIR=/home/Backups
DSEM=`date +%a`
DMES=`date +%d`
DYM=`date +%d%b`

#echo $DSEM > $FECHADIR/fecha-backup-SEM
#echo $DMES > $FECHADIR/fecha-backup-MES
#echo $DYM > $FECHADIR/fecha-backup-DiaMes

# "NUEVO" coge la fecha del backup completo de cada domingo
# Backup mensual completo - sobrescribe el del mes anterior
if [ $DMES = "23" ]; then
tar -cf $BACKUPDIR/CTM_$DYM.tar $DIRECTORIOS
scp $BACKUPDIR/CTM_$DYM.tar alberto@192.168.1.2:/home/alberto/copias
fi
# Backup semanal completo
# Actualiza la fecha del backup completo
if [ $DSEM = "mar" ]; then
AHORA=`date +%d-%b`
echo $AHORA > $FECHADIR/fecha-backup-completo
tar -cf $BACKUPDIR/CTS_$DSEM.tar $DIRECTORIOS
scp $BACKUPDIR/CTS_$DSEM.tar alberto@192.168.1.2:/home/alberto/copias
else
# Backup incremental diario - sobrescribe semana anterior
# Obtiene fecha del último backup completo, opción newer.
NUEVO="--newer=`cat $FECHADIR/fecha-backup-completo`"
tar $NUEVO -cf $BACKUPDIR/ID_$DSEM.tar $DIRECTORIOS
scp $BACKUPDIR/ID_$DSEM.tar alberto@192.168.1.2:/home/alberto/copias
fi

