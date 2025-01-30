# Simulateur de Caméra Spatiale
 simulateur de caméra spatiale pour tester et valider les algorithmes de traitement d'images en temps réel

 # Simulateur de Caméra Spatiale

## Description

Ce projet vise à créer un simulateur de caméra spatiale en utilisant une approche DevOps pour optimiser le développement de A à Z. Le projet inclut un environnement de développement configuré avec Docker et VNC pour faciliter l'accès à l'interface graphique.

## Prérequis

- Docker
- Docker Compose
- TigerVNC Viewer

## Installation

1. **Cloner le dépôt** :

   ```sh
   git clone <URL_DE_VOTRE_DEPOT>
   cd Simulateur-de-Cam-ra-Spatiale
Construire et démarrer les conteneurs Docker :


docker-compose up --build -d
Accéder au conteneur de développement :


docker-compose exec dev-env bash
Démarrer Xvfb et x11vnc :


Xvfb :1 -screen 0 1920x1080x24 &
x11vnc -display :1 -rfbport 5901 -forever -shared -rfbauth /root/.vnc/passwd
Configuration de VNC
Configurer le mot de passe VNC :


vncpasswd
Entrez un mot de passe lorsque vous y êtes invité.
Confirmez le mot de passe en le retapant.
Répondez n (non) à la question "Would you like to enter a view-only password (y/n)?".
Connexion via TigerVNC :

Lancez vncviewer.exe.
Entrez localhost:5901 comme adresse du serveur.
Assurez-vous que l'option de chiffrement est définie sur Always Off.
Entrez le mot de passe que vous avez défini.
