FROM archlinux/base

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		# Basic nice to haves
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim git \
		# Fonts
		noto-fonts noto-fonts-extra noto-fonts-emoji \
		ttf-droid ttf-dejavu ttf-liberation ttf-fira-code \
		ttf-fira-mono ttf-roboto cantarell-fonts \
        # Other
        ffmpeg

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur

RUN cd /tmp/aur \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/vivaldi.tar.gz \
	&& tar xzf vivaldi.tar.gz \
	&& cd vivaldi \
	&& makepkg -sic --noconfirm \
    && cd /

#RUN cd /tmp/aur \
#    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/vivaldi-ffmpeg-codecs.tar.gz \
#    && tar xzf vivaldi-ffmpeg-codecs.tar.gz \
#    && cd vivaldi-ffmpeg-codecs \
#    && makepkg -sic --noconfirm \
#    && cd /

RUN cd /tmp/aur \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/vivaldi-widevine.tar.gz \
    && tar xzf vivaldi-widevine.tar.gz \
    && cd vivaldi-widevine \
    && makepkg -sic --noconfirm \
    && cd /

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

USER $USERNAME

ENTRYPOINT ["/bin/vivaldi-stable"]

#ENTRYPOINT ["/bin/zsh"] # Use for debugging stuff
