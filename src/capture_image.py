import cv2
import numpy as np

def capture_image():
    # Générer une image aléatoire
    img = np.random.randint(0, 255, (512, 512, 3), dtype=np.uint8)
    
    # Dessiner un rectangle bleu
    cv2.rectangle(img, (384, 0), (510, 128), (255, 0, 0), 3)
    
    # Sauvegarder l'image
    cv2.imwrite('captured_image.png', img)
    
    # Afficher l'image
    cv2.imshow('Captured Image', img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    return img

if __name__ == "__main__":
    capture_image()