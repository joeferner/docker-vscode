FROM centos:8

RUN yum install -y \
    libxshmfence \
    nss \
    atk \
    at-spi2-atk \
    libdrm \
    gdk-pixbuf2 \
    gtk2 \
    gtk3 \
    mesa-libgbm \
    alsa-lib \
    libxkbfile \
    xauth \
    libX11-xcb \
    open-sans-fonts

RUN curl -L -o /vscode.tar.gz 'https://code.visualstudio.com/sha/download?build=stable&os=linux-x64'
RUN tar xzf vscode.tar.gz
RUN chown -R root:root VSCode-linux-x64/
RUN chmod 4755 VSCode-linux-x64/chrome-sandbox

ARG user
ARG uid
ARG gid
RUN groupadd --gid $gid $user
RUN useradd --uid $uid --gid $gid $user

WORKDIR /home/$user
ADD vscode.sh vscode.sh
