FROM archlinux/archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
        wget \
	    ttf-dejavu ttf-droid \
	    libxrender freetype2 libxft libxtst glu \
	    icoutils xdg-user-dirs qt5-base

RUN useradd --create-home --shell=/bin/bash $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
	&& curl -X GET https://aur.archlinux.org/cgit/aur.git/snapshot/chitubox-free-bin.tar.gz  --output chitubox-free-bin.tar.gz \
	&& tar xzf chitubox-free-bin.tar.gz \
	&& cd chitubox-free-bin \
	&& makepkg -sic --noconfirm

USER root
RUN userdel -r $BUILD
RUN sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

WORKDIR /files/

#ENTRYPOINT [ "bash" ]
ENTRYPOINT [ "chitubox-free" ]
