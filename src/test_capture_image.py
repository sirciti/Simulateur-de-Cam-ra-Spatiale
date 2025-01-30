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
