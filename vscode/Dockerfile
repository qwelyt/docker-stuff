FROM archlinux/base

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
		libxrender freetype2 libxft libxtst \
		jre-openjdk jdk-openjdk \
        jad maven \
        code

RUN pacman -Scc --noconfirm

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel,docker -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors

USER developer
#ENTRYPOINT ["/usr/bin/zsh"]
#ENTRYPOINT ["/usr/sbin/code"]
CMD /usr/sbin/code & sleep infinity
