FROM archlinux:base-devel

ARG DOCKER_GID=3000

ENV LANG C.UTF-8
ENV USERNAME developer
ENV BUILD build

RUN groupadd -g $DOCKER_GID docker

RUN pacman -Syyu --noconfirm \
	&& pacman -S --needed --noconfirm base-devel \
	&& pacman -S --noconfirm \
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
		noto-fonts noto-fonts-extra noto-fonts-emoji ttf-droid ttf-dejavu ttf-liberation \
		libxrender freetype2 libxft libxtst mesa glu \
		jre-openjdk jdk-openjdk go rustup python \
        	jad maven python-pip pyenv \
        	code

RUN eval "$(pyenv ini -)"
RUN pyenv install 3.10.11 && pyenv global 3.10.11


RUN pacman -Scc --noconfirm

RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel,docker -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd

RUN mv /usr/share/icons/Adwaita/cursors /usr/share/icons/Adwaita/_cursors

COPY start.sh start.sh
RUN chmod +x start.sh

USER developer
RUN rustup toolchain install stable && rustup default stable
RUN pyenv exec python -m pip install git+https://github.com/gumyr/build123d
RUN pyenv exec python -m pip install --pre "cadquery>=2.2"
#ENTRYPOINT ["/usr/bin/zsh"]
#CMD ["QT_X11_NO_MITSHM=1 /usr/sbin/code","--verbose"]
#ENTRYPOINT ["QT_X11_NO_MITSHM=1 /usr/sbin/code"]
#CMD ["--verbose"]
#CMD /usr/sbin/code & sleep infinity
ENTRYPOINT ["/start.sh"]
