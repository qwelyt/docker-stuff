FROM archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar \
		sudo openssh zsh grml-zsh-config vim git \
		noto-fonts noto-fonts-extra noto-fonts-emoji \
        ttf-droid ttf-dejavu ttf-liberation \
		libxrender freetype2 libxft libxtst \
        libpulse alsa-lib gtk3 libxss libxtst nss xdg-utils

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
    && curl -X GET https://aur.archlinux.org/cgit/aur.git/snapshot/slack-desktop.tar.gz --output app.tar.gz \
	&& tar xzf app.tar.gz \
	&& cd slack-desktop \
	&& makepkg -sic --noconfirm

USER root
RUN userdel -r $BUILD
RUN sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors

# To be able to connect to hosts pulseaudio server and get sound
COPY pulse-client.conf /etc/pulse/client.conf 

# Also for sound
RUN usermod -aG audio $USERNAME 


USER developer
#ENTRYPOINT ["/bin/zsh"]
ENTRYPOINT ["/usr/sbin/slack"]
