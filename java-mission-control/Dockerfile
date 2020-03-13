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
		jre-openjdk jdk-openjdk \
        gtk3

RUN pacman -Scc --noconfirm

RUN mkdir /tmp/jmc \
    && cd /tmp/jmc \
    && wget https://download.java.net/java/GA/jmc7/14/jmc-7_linux-x64_bin.tar.gz \
    && tar xzf jmc-7_linux-x64_bin.tar.gz


#USER $USERNAME

ENTRYPOINT ["/tmp/jmc/jmc-7+14_linux-x64_bin/bin/jmc"]

#ENTRYPOINT ["/bin/zsh"] # Use for debugging stuff
