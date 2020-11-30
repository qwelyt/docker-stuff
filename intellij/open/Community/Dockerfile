FROM archlinux/base

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
		libxrender freetype2 libxft libxtst \
		jre-openjdk jdk-openjdk java-openjfx \
        jad maven \
		intellij-idea-community-edition

##RUN pacman -U --noconfirm https://archive.archlinux.org/packages/i/intellij-idea-community-edition/intellij-idea-community-edition-2%3A2019.3-1-x86_64.pkg.tar.xz

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

USER developer
ENTRYPOINT ["/bin/zsh"]
#ENTRYPOINT ["/usr/sbin/idea"]
#CMD ["--verbose"]
