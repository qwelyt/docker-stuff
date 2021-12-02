FROM archlinux:base-devel

ARG DOCKER_GID=3000

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN groupadd -g $DOCKER_GID docker

RUN pacman -Syyu --noconfirm \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation ttf-jetbrains-mono \
		libxrender freetype2 libxft libxtst \
		jre-openjdk jdk-openjdk java-openjfx python \
        jad maven \
		intellij-idea-community-edition

RUN cd /tmp \
    && curl -X GET 'https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz' --output jdk15.0.2.tar.gz \
    && tar xzf jdk15.0.2.tar.gz \
    && mv jdk-15.0.2 /usr/lib/jvm/java-15-openjdk

RUN cd /tmp \
    && curl -X GET 'https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz' --output jdk17.tar.gz \
    && tar xzf jdk17.tar.gz \
    && mv jdk-17 /usr/lib/jvm/java-17-openjdk

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd
RUN gpasswd -a $USERNAME docker
RUN gpasswd -a $USERNAME wheel

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors
RUN dbus-uuidgen --ensure=/etc/machine-id

RUN archlinux-java set java-17-openjdk

USER developer
RUN mkdir -p /home/developer/.cache/JetBrains
#ENTRYPOINT ["/bin/zsh"]
ENTRYPOINT ["/usr/sbin/idea"]
#CMD ["--verbose"]
