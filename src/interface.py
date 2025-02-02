# interface.py
import tkinter as tk
from PIL import Image, ImageTk
import cv2

def show_image(image_path):
    # Charger l'image
    img = cv2.imread(image_path)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = Image.fromarray(img)
    img_tk = ImageTk.PhotoImage(img)

    # Afficher l'image
    label = tk.Label(image=img_tk)
    label.image = img_tk
    label.pack()

root = tk.Tk()
show_image('captured_image.png')
root.mainloop()
