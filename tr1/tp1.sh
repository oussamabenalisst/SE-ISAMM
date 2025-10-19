#*Commandes d'identité utilisateur
#Commandes d'identité utilisateur
#! ******************************
#?1-on doit se connecter aux systheme et ouvrir une session
#?2-l'identification permet à l'utilisateur d'être identifié par la machine d'accéder aux systheme et d'ouvrir sa propre session puisque c'est un systheme multi utulisateur
#?3-l'utilisateur doit taper son nom d'utilisateur log in et son  mot de passe paasword
#! ******************************
id #Affiche l'identifiant utilisateur (UID), l'identifiant de groupe (GID), et les groupes auxquels appartient l'utilisateur courant.
longname #Affiche le nom d'utilisateur utilisé pour se connecter à la session en cours.
whoami #Affiche le nom d'utilisateur de l'utilisateur courant.

#*Commandes liées au temps et au calendrier

cal #Affiche le calendrier du mois en cours.
date #Affiche la date et l'heure actuelles.

#* Commandes d'information sur les utilisateurs

who #Affiche une liste des utilisateurs actuellement connectés au système.
groups #Affiche les groupes auxquels appartient l'utilisateur courant.

su - #Permet de changer d'utilisateur, en ouvrant une nouvelle session pour l'utilisateur spécifié (par défaut, root).

#*------gestion users-------
useradd test  # Création d'un nouvel utilisateur nommé "test"
cat /etc/passwd
passwd test # Définition du mot de passe pour l'utilisateur "test"
cat /etc/shadow # Affichage du fichier shadow pour voir le mot de passe chiffré
usermod -aG sudo test # Ajout de l'utilisateur "test" au groupe sudo
cat /etc/group # Affichage du fichier group pour vérifier l'ajout au groupe sudo
usermod -s /bin/bash test # Changement du shell de l'utilisateur "test" en bash
cat /etc/passwd
#*----- gestion des groups-------
groupadd eleve # Création d'un nouveau groupe nommé "eleve"
cat /etc/group # Affichage du fichier group pour vérifier la création du groupe
usermod -aG eleve test
cat /etc/group
#*-------supp group-------
userdel -r test # Suppression de l'utilisateur "test" et de son répertoire personnel
groupdel eleve # Suppression du groupe "eleve"