FROM archlinux:base-devel

ENV BUILD build

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
    p7zip sudo \
    mesa libxrender freetype2 libxft libxtst glu \
	ttf-dejavu ttf-droid 

RUN useradd --shell=/bin/bash $BUILD \
    && usermod -L $BUILD \
    && echo "$BUILD ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $BUILD

RUN mkdir /tmp/aur \
    && cd /tmp/aur \
    && curl -X GET 'https://aur.archlinux.org/cgit/aur.git/snapshot/miniconda3.tar.gz' --output miniconda3.tar.gz \
    && tar xzf miniconda3.tar.gz \
    && cd miniconda3 \
    && makepkg -sic --noconfirm \
    && sudo ln -s /opt/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh


USER root
RUN userdel -r $BUILD \
    && sed -i "/${BUILD} ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers

RUN /opt/miniconda3/bin/conda install -c cadquery -c conda-forge cq-editor=master
RUN /opt/miniconda3/bin/conda create -n nales
RUN /opt/miniconda3/bin/conda init bash && bash && /opt/miniconda3/bin/conda activate nales
RUN mkdir /Nales-git/ \
    && cd /Nales-git \
    && git clone https://github.com/Jojain/Nales.git \
    && cd Nales
RUN /opt/miniconda3/bin/conda env update --file environment.yml -n nales
RUN python setup.py install
RUN rm /opt/miniconda3/lib/libstdc++.so.6
WORKDIR /files/


#ENTRYPOINT [ "/usr/bin/cq-editor/CQ-editor.sh" ]
#ENTRYPOINT [ "/usr/bin/cq-editor/CQ-editor/CQ-editor" ]
#ENTRYPOINT [ "cq-editor" ]
#ENTRYPOINT [ "/opt/miniconda3/bin/cq-editor" ]
ENTRYPOINT [ "python", "/Nales-git/Nales/scripts/run_nales.py" ]
