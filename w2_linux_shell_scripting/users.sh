#!/bin/sh
if [ "$(id -u)" -ne 0 ]
	then
		echo "Cette commande doit être lancée en tant que root."
	exit 3
fi

if [ -z "$1" ]
	then
		echo "Utilisation: $0 <fichier.csv>"
	exit 1
fi

if [ ! -f "$1" ]
	then
		echo "Le fichier $1 n'existe pas."
	exit 2
fi

creer_groupe() {
	getent group | grep -q "^$1:" && return
	groupadd "$1"
	mkdir -p "/home/$1"
}

supprimer_groupe() {
	rmdir "/home/$1" >/dev/null 2>&1
	if [ $? -eq 0 ]
		then
		groupdel "$1"
	fi
}

# tail enlève la ligne d'en-tête, titres des colonnes
tail -n +2 $1 | while read data
do
	# Récupérer les données des différents champs
	prenom="$(echo "$data" | cut -d";" -f1)"
	nom="$(echo "$data" | cut -d";" -f2)"
	passe="$(echo "$data" | cut -d";" -f3)"
	lieu="$(echo "$data" | cut -d";" -f4)"
	user="$(echo "${prenom}_$nom" | tr "[A-Z]. " "[a-z]__" |
	sed 'y/àâéèêëîïôöüÀÂÉÈÊËÎÏÔÖÜçÇ/aaeeeeiioouaaeeeeiiooucc/')"
	groupe="$(echo "$lieu" | tr "[A-Z] " "[a-z]_" | tr -d "-" |
	sed 'y/àâéèêëîïôöüÀÂÉÈÊËÎÏÔÖÜçÇ/aaeeeeiioouaaeeeeiiooucc/')"
	dossier="/home/$groupe/$user"
	commentaire="$prenom $nom,,,,$lieu"
	echo -n "$user: "
	if (id "$user" > /dev/null 2>&1)
		then
		# L'utilisateur existe
		groupe_actuel="$(id -gn $user)"
		if [ "$lieu" = "-" ]
			then
				echo "à supprimer"
				userdel "$user"
				mkdir -p /archives
				tar zcf "/archives/$user-$(date +"%Y%m%d").tar.gz" \
				--directory="/home/$groupe_actuel" "$user" &&
				rm -fr "/home/$groupe_actuel/$user"
				supprimer_groupe "$groupe_actuel"
				continue
		fi
		if [ "$groupe_actuel" = "$groupe" ]
			then
				echo "existe déjà"
				continue
		fi
		echo "changement de groupe"
		creer_groupe $groupe
		usermod --home "$dossier" --move-home \
		--gid "$groupe" --comment "$commentaire" "$user"
		supprimer_groupe "$groupe_actuel"
	else
		# L'utilisateur n'existe pas
		if [ "$lieu" = "-" ]
			then
			echo "à ne pas créer"
			continue
		fi
		echo "création"
		creer_groupe $groupe
		useradd --home-dir "$dossier" --gid "$groupe" \
		--comment "$commentaire" -s "/bin/bash" "$user"
		echo "$user:$passe" | chpasswd
		if [ -e "$dossier" ]
			then
				chown "$user:$groupe" "$dossier"
		else
			cp -r /etc/skel "$dossier"
			chown --recursive "$user:$groupe" "$dossier"
		fi
	fi
done
