# Utilisation d'une image légère et sécurisée
FROM ubuntu:22.04 AS base

# Désactiver l'interactivité pour éviter les prompts bloquants
ARG DEBIAN_FRONTEND=noninteractive

# Création d'un utilisateur non-root avec UID/GID pour plus de contrôle
RUN groupadd -g 1001 devgroup && \
    useradd -m -u 1001 -g devgroup -s /bin/bash devuser

# Mettre à jour les paquets et installer les dépendances minimales
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential cmake git wget curl python3 python3-pip python3-venv \
    doxygen gdb qemu libgtk-3-0 xvfb dbus-x11 x11-xserver-utils \
    tigervnc-standalone-server tigervnc-common x11vnc && \
    rm -rf /var/lib/apt/lists/*

# Installer OpenCV et NumPy uniquement pour l'utilisateur non-root
USER devuser
RUN pip3 install --no-cache-dir opencv-python numpy

# Définir le répertoire de travail
WORKDIR /home/devuser/app

# Copier les fichiers nécessaires avec les bonnes permissions
COPY --chown=devuser:devgroup start.sh /home/devuser/start.sh
RUN chmod 750 /home/devuser/start.sh

# Définir la commande par défaut pour démarrer l'environnement sécurisé
CMD ["/home/devuser/start.sh"]
