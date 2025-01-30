import cv2

# Charger l'image
img = cv2.imread('image_simulee.jpg')

# Appliquer un traitement simple (conversion en niveaux de gris)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Enregistrer l'image traitée
cv2.imwrite('image_traitee.jpg', gray)
