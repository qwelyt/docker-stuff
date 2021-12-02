FROM archlinux:base-devel

ENV LANG C.UTF-8
ENV USERNAME developer
ENV PATH=$PATH:/home/developer/.cargo/bin
ARG DOCKER_GID=3000

RUN pacman -Syu --noconfirm \
	&& pacman -S --noconfirm \
		# Basic nice to haves
		iproute2 iputils mlocate tar wget \
		sudo openssh zsh grml-zsh-config vim docker git \
        python rustup rust-racer

RUN updatedb


RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN useradd -m -G wheel -s /bin/zsh $USERNAME \
	&& echo "$USERNAME:$USERNAME" | chpasswd


USER $USERNAME

RUN rustup install stable && rustup default stable
RUN cd $HOME \
    && export PATH=$PATH:/home/developer/.cargo/bin \
    && curl -L https://git.io/install-rustlings | bash

ENTRYPOINT ["/bin/zsh"]
