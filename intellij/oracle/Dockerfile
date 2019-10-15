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
		libxrender freetype2 libxft \

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

COPY jdk-8u221-linux-x64.tar.gz /home/$USERNAME/Downloads

RUN mkdir /tmp/aur

RUN cd /tmp/aur \
	&& wget .... \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/jdk8-8u221-1-x86_64.pkg.tar.gz \
	&& tar xzf jdk8-8u221-1-x86_64.pkg.tar.gz \
	&& cd ... \
	&& makepkg -sic --noconfirm

RUN cd /tmp/aur \
    && wget https://aur.archlinux.org/cgit/aur.git/snapshot/intellij-idea-ultimate-edition.tar.gz \
	&& tar xzf intellij-idea-ultimate-edition.tar.gz \
	&& cd intellij-idea-ultimate-edition \
	&& makepkg -sic --noconfirm

USER root
RUN userdel -r $BUILD
RUN sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN pacman -Scc --noconfirm
RUN rm -rf /tmp/*

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

USER developer
ENTRYPOINT ["/usr/sbin/intellij-idea-ultimate-edition"]
