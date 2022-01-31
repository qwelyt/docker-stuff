FROM archlinux:base-devel

ENV BUILD build

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
#    p7zip sudo \
    mesa libxrender freetype2 libxft libxtst glu qt 
#	ttf-dejavu ttf-droid 
#
RUN curl -X GET 'https://www.opencascade.com/sites/default/files/private/occt/applications/cad_assistant_1.6.0_2021-10-05_lin64.appimage' --output cad_assistant.appimage
RUN chmod +x cad_assistant.appimage
RUN ./cad_assistant.appimage --appimage-extract

WORKDIR files

ENTRYPOINT [ "/squashfs-root/AppRun" ]
