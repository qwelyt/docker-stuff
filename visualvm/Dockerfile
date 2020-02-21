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
        # X
		libxrender freetype2 libxft libxtst \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
		# Application
        visualvm


RUN pacman -Scc --noconfirm


#USER $USERNAME

ENTRYPOINT ["/usr/share/visualvm/bin/visualvm"]

#ENTRYPOINT ["/bin/zsh"] # Use for debugging stuff
