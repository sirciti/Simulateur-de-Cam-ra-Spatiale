# Utilisation d'une image légère et sécurisée
FROM ubuntu:22.04 AS base

# Création d'un utilisateur non-root
RUN useradd -m -s /bin/bash devuser
ARG DEBIAN_FRONTEND=noninteractive

# Mettre à jour les paquets et installer les dépendances minimales
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    build-essential cmake git wget curl python3 python3-pip python3-venv \
    doxygen gdb qemu libgtk-3-0 xvfb dbus-x11 x11-xserver-utils \
    tigervnc-standalone-server tigervnc-common x11vnc && \
    rm -rf /var/lib/apt/lists/*

# Installer OpenCV et NumPy
RUN pip3 install --no-cache-dir opencv-python numpy

# Définir l'utilisateur non-root
USER devuser

# Définir le répertoire de travail
WORKDIR /home/devuser/app

# Copier les fichiers nécessaires
COPY --chown=devuser:devuser start.sh /home/devuser/start.sh
RUN chmod +x /home/devuser/start.sh

# Définir la commande par défaut pour démarrer le serveur VNC
CMD ["/home/devuser/start.sh"]
