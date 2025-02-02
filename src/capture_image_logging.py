import cv2
import numpy as np
import os
import logging
from datetime import datetime

# Définition des chemins absolus
IMAGE_DIR = "/workspace/src/images"
LOG_DIR = "/workspace/src/logs"
LOG_FILE = f"{LOG_DIR}/simulation.log"

# Créer les répertoires s'ils n'existent pas
os.makedirs(IMAGE_DIR, exist_ok=True)
os.makedirs(LOG_DIR, exist_ok=True)

# Configuration des logs
logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

def capture_image():
    # Générer une image aléatoire
    img = np.random.randint(0, 255, (512, 512, 3), dtype=np.uint8)

    # Dessiner un rectangle bleu
    cv2.rectangle(img, (384, 0), (510, 128), (255, 0, 0), 3)

    # Générer un nom de fichier unique avec le bon chemin
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    image_path = f"{IMAGE_DIR}/captured_{timestamp}.png"

    # Sauvegarder l'image
    cv2.imwrite(image_path, img)

    # Écrire dans les logs avec le bon chemin
    logging.info(f"Image capturée et sauvegardée : {image_path}")

    return img

if __name__ == "__main__":
    capture_image()
