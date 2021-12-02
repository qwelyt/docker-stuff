FROM archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar jdk-openjdk jdk8-openjdk \
		sudo openssh zsh grml-zsh-config vim git

RUN useradd --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN mkdir /home/$BUILD && chown $BUILD:users /home/$BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN archlinux-java set java-8-openjdk

USER $BUILD

RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
    && curl -X GET https://aur.archlinux.org/cgit/aur.git/snapshot/kafkatool.tar.gz --output app.tar.gz \
	&& tar xzf app.tar.gz \
	&& cd kafkatool \
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
ENTRYPOINT ["/usr/sbin/kafkatool"]
#ENTRYPOINT ["/usr/bin/zsh"]
