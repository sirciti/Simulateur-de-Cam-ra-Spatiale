import cv2
import numpy as np

# Créer une image noire
img = np.zeros((512, 512, 3), np.uint8)

# Afficher l'image
cv2.imshow('Test Image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

print("OpenCV et NumPy fonctionnent correctement.")
