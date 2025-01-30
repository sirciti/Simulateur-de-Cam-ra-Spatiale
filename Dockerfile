# Utiliser une image de base plus légère et à jour
FROM ubuntu:22.04

# Mettre à jour les paquets et installer les dépendances de base
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    python3 \
    python3-pip \
    python3-venv \
    doxygen \
    gdb \
    qemu \
    libgtk-3-0 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxfixes3 \
    libxtst6 \
    libxcb1 \
    libx11-xcb1 \
    libxcomposite1 \
    libasound2 \
    libpangocairo-1.0-0 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libglib2.0-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    lsb-release \
    xdg-utils \
    wget \
    xvfb \
    dbus-x11 \
    x11-xserver-utils \
    tigervnc-standalone-server \
    tigervnc-common \
    && rm -rf /var/lib/apt/lists/*

# Installer FreeRTOS
RUN git clone --recursive https://github.com/FreeRTOS/FreeRTOS.git /opt/FreeRTOS

# Installer Eclipse (version la plus récente)
RUN wget -q -O - https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2023-09/R/eclipse-cpp-2023-09-R-linux-gtk-x86_64.tar.gz | tar -xz -C /opt

# Installer Google Test (version la plus récente)
RUN git clone https://github.com/google/googletest.git /opt/googletest \
    && cd /opt/googletest \
    && mkdir -p build \
    && cd build \
    && cmake .. \
    && make \
    && make install

# Installer CppUTest (version la plus récente)
RUN git clone https://github.com/cpputest/cpputest.git /opt/cpputest \
    && cd /opt/cpputest \
    && mkdir -p build \
    && cd build \
    && cmake .. \
    && make \
    && make install

# Installer Sphinx (version la plus récente)
RUN pip3 install sphinx

# Configurer VNC
RUN mkdir -p /root/.vnc && echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd

# Configurer le fichier xstartup pour VNC
RUN echo "#!/bin/sh" > /root/.vnc/xstartup \
    && echo "unset SESSION_MANAGER" >> /root/.vnc/xstartup \
    && echo "exec /etc/X11/xinit/xinitrc" >> /root/.vnc/xstartup \
    && chmod +x /root/.vnc/xstartup

# Désactiver le chiffrement VNC
RUN echo "SecurityTypes=None" >> /etc/tigervnc/vncserver.users

# Définir le répertoire de travail
WORKDIR /workspace

# Copier le code source dans le conteneur
COPY . .

# Exposer le port pour VNC
EXPOSE 5901

# Définir la commande par défaut pour démarrer le serveur VNC
CMD ["vncserver", ":1", "-geometry", "1920x1080", "-depth", "24"]
