FROM archlinux:base-devel

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin/:$PATH"

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
    p7zip sudo \
    mesa libxrender freetype2 libxft libxtst glu \
    ttf-dejavu ttf-droid \
    git python python-pip qt5-base pyenv

RUN eval "$(pyenv init -)"

RUN pyenv install 3.10.11 \
	&& pyenv global 3.10.11


RUN pyenv exec pip install pyqt5 spyder~=5.0 path pyqtgraph logbook requests
RUN pyenv exec pip install git+https://github.com/jdegenstein/jmwright-CQ-Editor
RUN pyenv exec pip install --pre "cadquery>=2.2"
RUN pyenv exec pip install git+https://github.com/gumyr/build123d

WORKDIR /files/

ENTRYPOINT [ "pyenv", "exec", "cq-editor" ]
