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



### Créer un Répertoire pour le Code Source

Dans le conteneur Docker, créez un répertoire pour stocker votre code source.

```sh
mkdir src
cd src
Installer les Dépendances Nécessaires
Installez les bibliothèques Python nécessaires pour le traitement d'images et la simulation.


apt-get update
apt-get install -y python3 python3-pip
pip3 install opencv-python numpy
Créer un Script Python de Base
Créez un fichier test_opencv.py dans le répertoire src pour tester l'installation d'OpenCV et NumPy.


# test_opencv.py
import cv2
import numpy as np

# Créer une image noire
img = np.zeros((512, 512, 3), np.uint8)

# Afficher l'image
cv2.imshow('Test Image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

print("OpenCV et NumPy fonctionnent correctement.")
Ajouter des Fonctionnalités de Base
Modifiez le fichier capture_image.py pour inclure la fonctionnalité de capture d'images simulées.


# capture_image.py
import cv2
import numpy as np

def capture_image():
    # Créer une image noire
    img = np.zeros((512, 512, 3), np.uint8)

    # Dessiner un rectangle bleu
    cv2.rectangle(img, (384, 0), (510, 128), (255, 0, 0), 3)

    # Sauvegarder l'image
    cv2.imwrite('captured_image.png', img)

    return img

if __name__ == "__main__":
    capture_image()
Tester et Valider
Créez un fichier test_capture_image.py pour écrire des tests unitaires.


# test_capture_image.py
import unittest
import cv2
import numpy as np
from capture_image import capture_image

class TestCaptureImage(unittest.TestCase):
    def test_capture_image(self):
        # Exécuter la fonction de capture d'image
        img = capture_image()

        # Vérifier que l'image a été sauvegardée
        saved_img = cv2.imread('captured_image.png')
        self.assertIsNotNone(saved_img)
        self.assertEqual(saved_img.shape, (512, 512, 3))

if __name__ == '__main__':
    unittest.main()
Exécutez les tests pour valider que la fonctionnalité de capture d'images fonctionne correctement.


python3 -m unittest test_capture_image.py
Sauvegarder les Modifications
Faites un commit pour sauvegarder vos modifications.


git add .
git commit -m "Installation de Python et exécution des tests unitaires"




# Sécurité & Bonnes Pratiques 

Utilisateur non-root : Empêche l’exécution des processus en tant que root pour limiter les risques.

Optimisation Docker : Suppression des caches inutiles pour réduire la taille de l’image.

Gestion des accès : Utilisation de fichiers .env pour stocker les informations sensibles.

CI/CD sécurisé : Vérifications de sécurité automatisées via GitHub Actions.