FROM archlinux:base-devel

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
        firefox

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

ENTRYPOINT ["/usr/sbin/firefox"]
