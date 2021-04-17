#!/bin/bash
#adri
#
clear
echo -n "Escriba el nombre del Fichero: "
read Fichero
echo -n "Escriba la ruta en la que se encuentra el Fichero deseado: "
read Ruta

if [[ ! -d $Ruta ]]
then
	echo "No existe"
else
	if [[ ! -e $Ruta$Fichero ]]
	then
		echo "El fichero no existe"
	else
		if [[ ! -d ~/FitxConfBackup ]]
		then
			mkdir ~/FitxConfBackup
		fi
		if [[ -e ~/FitxConfBackup/$Fichero ]]
		then
			grep '^[^#]' "$Ruta""$Fichero" > ~/FitxConfBackup/"$Fichero"
		else
			grep '^[^#]' "$Ruta""$Fichero" >> ~/FitxConfBackup/"$Fichero"
		fi
	fi
fi
exit 0