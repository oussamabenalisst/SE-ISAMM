# Fiche de cours — Commandes utilisateur et gestion (TP1)

## Objectifs

- Comprendre l'identification et l'authentification d'un utilisateur sur le système.
- Savoir afficher des informations système liées aux utilisateurs et au temps.
- Apprendre les commandes de gestion des comptes et des groupes (création, modification, suppression).

---

## 1. Identification de l'utilisateur

- id

  - Affiche l'identifiant utilisateur (UID), l'identifiant de groupe (GID) et la liste des groupes de l'utilisateur courant.
  - Exemple : `id`

- whoami

  - Affiche le nom de l'utilisateur courant.
  - Exemple : `whoami`

- longname (commande mentionnée)
  - Selon l'environnement, `longname` peut afficher le nom complet (GECOS) ou des informations d'identification. Sur certaines distributions, cette commande n'est pas standard.

Notes :

- L'utilisateur se connecte au système avec un nom d'utilisateur (login) et un mot de passe.
- Dans un système multi-utilisateur, l'identification permet d'assigner droits et sessions distinctes à chaque utilisateur.

---

## 2. Commandes temps / calendrier

- cal

  - Affiche le calendrier du mois en cours (ou d'un mois donné).
  - Exemple : `cal` ou `cal 2025`.

- date
  - Affiche la date et l'heure actuelles.
  - Exemple : `date` ; formatage possible : `date +"%Y-%m-%d %H:%M:%S"`.

---

## 3. Informations sur les utilisateurs connectés

- who

  - Liste les utilisateurs actuellement connectés.
  - Exemple : `who`

- groups
  - Affiche les groupes auxquels appartient l'utilisateur courant.
  - Exemple : `groups` ; ou `groups username`.

---

## 4. Changer d'utilisateur

- su -
  - Permet de changer d'utilisateur et d'ouvrir une nouvelle session pour cet utilisateur (par défaut `root`).
  - Exemple : `su -` (puis saisir le mot de passe root).
  - Attention : `sudo` est souvent préféré pour exécuter une seule commande avec privilèges élevés.

---

## 5. Gestion des utilisateurs (création, modification, suppression)

- useradd

  - Crée un nouvel utilisateur. Exemple : `useradd test`.
  - Options courantes : `-m` (crée le répertoire personnel), `-s /bin/bash` (choisit le shell), `-G` (groupes supplémentaires).

- passwd

  - Définit ou modifie le mot de passe d'un utilisateur. Exemple : `passwd test`.

- usermod

  - Modifie un compte existant. Exemple : `usermod -aG sudo test` pour ajouter `test` au groupe `sudo`.
  - Option `-s /bin/bash` change le shell : `usermod -s /bin/bash test`.

- userdel
  - Supprime un utilisateur. Exemple : `userdel -r test` supprime également le répertoire personnel (`-r`).

Fichiers système associés :

- `/etc/passwd` : informations de compte (nom, UID, GID, répertoire personnel, shell, etc.).
- `/etc/shadow` : mots de passe chiffrés et paramètres (accessible uniquement par root).

Conseil : toujours vérifier les commandes en tant que root (ou via sudo) et tester sur un compte non critique avant de supprimer.

---

## 6. Gestion des groupes

- groupadd

  - Crée un groupe. Exemple : `groupadd eleve`.

- usermod -aG

  - Ajoute un utilisateur à un groupe secondaire. Exemple : `usermod -aG eleve test`.

- groupdel

  - Supprime un groupe. Exemple : `groupdel eleve`.

- Fichier `/etc/group` : contient les groupes et leurs membres.

---

## 7. Exemples de séquence (pratique)

1. Créer un utilisateur "test" et lui donner un mot de passe :

   ```bash
   sudo useradd -m -s /bin/bash test
   sudo passwd test
   ```

2. Vérifier son ajout :

   ```bash
   cat /etc/passwd
   cat /etc/group
   ```

3. Ajouter l'utilisateur au groupe `sudo` :

   ```bash
   sudo usermod -aG sudo test
   ```

4. Supprimer l'utilisateur et son répertoire personnel :
   ```bash
   sudo userdel -r test
   ```

---

## 8. Bonnes pratiques et sécurité

- Ne partagez jamais le mot de passe root. Utilisez `sudo` pour limiter l'usage des privilèges.
- Limitez l'usage de `userdel -r` aux comptes tests ; sauvegardez les données importantes avant suppression.
- Utilisez toujours des mots de passe forts et, si possible, l'authentification à deux facteurs pour les services supportant cette option.
- Restreignez l'accès à `/etc/shadow` (protégé par défaut).

---

## 9. Exercices recommandés

- Créer 3 comptes utilisateurs (alice, bob, charlie), définir leurs mots de passe, et ajouter `alice` au groupe `admin` (ou `sudo`).
- Lister les utilisateurs connectés et afficher leurs shells.
- Écrire un court script qui crée un utilisateur si absent puis crée son répertoire personnel.

---

## 10. Références rapides

- `man useradd`, `man usermod`, `man userdel`, `man groupadd`
- Fichiers : `/etc/passwd`, `/etc/shadow`, `/etc/group`

Fin de la fiche.
