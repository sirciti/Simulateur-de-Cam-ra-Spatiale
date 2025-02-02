#!/bin/bash

# Démarrage de Xvfb
Xvfb :1 -screen 0 1920x1080x24 &

# Lancement de x11vnc
x11vnc -display :1 -rfbport 5901 -forever -shared -rfbauth /root/.vnc/passwd
