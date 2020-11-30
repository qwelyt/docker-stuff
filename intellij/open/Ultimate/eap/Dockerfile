FROM archlinux/base

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN groupadd --gid 976 docker
RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
		libxrender freetype2 libxft libxtst \
		jre-openjdk jdk-openjdk java-openjfx python \
        jad maven 

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/intellij-idea-ue-eap.tar.gz \
	&& tar xzf intellij-idea-ue-eap.tar.gz \
	&& cd intellij-idea-ue-eap \
	&& makepkg -sic --noconfirm

USER root
RUN userdel -r $BUILD
RUN sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel,docker -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors
RUN mkdir /opt/intellij-idea-ue-eap/plugins/terminal/.cache

USER developer
ENTRYPOINT ["/opt/intellij-idea-ue-eap/bin/idea.sh"]
##ENTRYPOINT ["/usr/sbin/intellij-idea-ultimate-edition"]
