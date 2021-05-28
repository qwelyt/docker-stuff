# dbeaver in a docker container
FROM archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
	dbeaver procps-ng grep \
	libxrender freetype2 libxft libxtst \
	noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
	jre-openjdk jdk-openjdk \
    gtk3
    #ttf-liberation ttf-cantarell ttf-opensans ttf-ubuntu-font-family \
	# font-noto font-noto-extra
	# font-noto-emoji font-noto-cjk font-fira-code

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors

RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

COPY start.sh /usr/bin/startDbeaver
RUN chmod +x /usr/bin/startDbeaver

USER $USERNAME

WORKDIR /home/${USERNAME}

ENTRYPOINT [ "startDbeaver" ]
#ENTRYPOINT [ "bash" ]
