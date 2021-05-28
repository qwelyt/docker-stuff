FROM archlinux:base-devel
ARG direct
ARG version=0.0.15

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
        # Application
        libpulse

RUN if [[ -z "$direct" ]] ; then \
        pacman -S --noconfirm discord \
    ; else \
        pacman -S --noconfirm libnotify libxss nss nspr gtk3 \
        && cd /opt \
        && curl -X GET https://dl.discordapp.net/apps/linux/$version/discord-$version.tar.gz --output discord.tar.gz \
        && tar -xzf discord.tar.gz \
        && ln -s /opt/Discord/Discord /usr/bin/discord \
    ; fi

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

ENTRYPOINT ["/usr/bin/discord"]
# Use for debugging stuff
#ENTRYPOINT ["/bin/zsh"] 
