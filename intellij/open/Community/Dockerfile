FROM archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN groupadd -g 976 docker

RUN pacman -Syyu --noconfirm \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation ttf-jetbrains-mono \
		libxrender freetype2 libxft libxtst \
		jre-openjdk jdk-openjdk java-openjfx python \
        jad maven \
		intellij-idea-community-edition

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/java-openjdk-bin.tar.gz \
	&& tar xzf java-openjdk-bin.tar.gz \
	&& cd java-openjdk-bin \
	&& makepkg -sic --noconfirm

USER root
RUN userdel -r $BUILD
RUN sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd
RUN gpasswd -a $USERNAME docker
RUN gpasswd -a $USERNAME wheel

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors
RUN dbus-uuidgen --ensure=/etc/machine-id

RUN archlinux-java set java-16-openjdk

USER developer
#ENTRYPOINT ["/bin/zsh"]
ENTRYPOINT ["/usr/sbin/idea"]
#CMD ["--verbose"]
