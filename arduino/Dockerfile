FROM archlinux

ENV USERNAME developer

RUN pacman -Syyu --noconfirm \
    && pacman -S --noconfirm \
        jre-openjdk arduino avrdude arduino-avr-core \
        libxrender freetype2 libxft libxtst \
        noto-fonts ttf-droid ttf-dejavu ttf-fira-code \
        sudo zsh grml-zsh-config wget 

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel,uucp,lock -s /bin/zsh $USERNAME \
    && echo "$USERNAME:$USERNAME" | chpasswd

#RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors

USER developer
WORKDIR /sketch/
ENTRYPOINT ["/usr/bin/arduino"]
