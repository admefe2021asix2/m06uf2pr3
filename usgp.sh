#!/bin/bash
#adri
#


function crgrup {
	clear
	echo "Creación de grupos de usuarios"
	echo
	echo "Que nombre quieres para el grupo:"
	read nom_grup
	echo "Que GID de grupo quieres?:"
	read gid 
	groupadd -g $gid $nom_grup > /dev/null 2>&1 
	if [ $? -ne 0 ]
	then
		echo "No se ha creado el grupo"
	fi
	return 0
}

function afegrup {
	clear
	echo "Dame un nombre de usuario:"
	read nom_usuari
	echo "Indica el grupo al qual se ha de añadir el usuario:"
	read nom_grup
	gpasswd -a $nom_usuari $nom_grup > /dev/null  
	if [ $? -ne 0 ]
	then
		echo "No se ha añadido el usuario al grupo"
	fi
	return 0
}

function esbgrup {
	clear
	echo "Dame un nombre de usuario:"
	read nom_usuari
	echo "Indica el grupo al qual se ha de añadir el usuario:"
	read nom_grup
	gpasswd -d $nom_usuari $nom_grup > /dev/null 2>&1   
	if [ $? -ne 0 ]
	then
		echo "No se ha podido borrar el usuario del grupo deseado"
	fi
	return 0
}

function menu {
	clear
	echo "A escojer:"
	echo "a) Crea un grupo"
	echo "b) Añade un usuari a un grupo"
	echo "c) Quitar un usuari de un grupo"
	echo -n "Selecciona una opción: "
	read opc
	case $opc in
		a) crgrup;;
		b) afegrup;;
		c) esbgrup;;
		*) echo "Opción incorrecta";;
	esac	
	return 0
}


if (( EUID != 0 ))
then
  echo "Este script se ha de ejecutar como root"
  exit 1  
fi

cont='s'
while [ $cont == 's' ]
do
	menu
	echo 
	echo -n "Quieres continuar? (s/n): "
	read cont
done

exit 5
