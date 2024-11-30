FROM archlinux:base-devel

ARG UUCP_GID=986
ARG DOCKER_GID=3000

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

#RUN groupmod -g $UUCP_GID uucp
RUN groupadd -g $DOCKER_GID docker

RUN pacman -Syyu --noconfirm \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation ttf-jetbrains-mono \
		libxrender freetype2 libxft libxtst \
                avrdude arduino-avr-core avr-gcc avr-libc \
		rustup arm-none-eabi-gdb qemu-base qemu-system-avr qemu-system-arm openocd \
		jdk-openjdk python

RUN useradd --no-create-home --shell=/bin/zsh $BUILD
RUN usermod -L $BUILD
RUN echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD
RUN mkdir /tmp/aur \
	&& cd /tmp/aur \
	&& curl -X GET 'https://aur.archlinux.org/cgit/aur.git/snapshot/rustrover.tar.gz' --output rustrover.tar.gz \
	&& tar xzf rustrover.tar.gz \
	&& cd rustrover \
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
RUN gpasswd -a $USERNAME uucp
RUN dbus-uuidgen --ensure=/etc/machine-id

USER developer
RUN mkdir -p /home/developer/.cache/JetBrains

RUN rustup install stable  \
    && rustup default stable \
    && rustup toolchain install nightly \
    && rustup component add rust-src --toolchain nightly
RUN cargo install ravedude
RUN cargo install cargo-expand
#ENTRYPOINT ["/bin/zsh"]
ENTRYPOINT ["rustrover"]
#CMD ["--verbose"]
