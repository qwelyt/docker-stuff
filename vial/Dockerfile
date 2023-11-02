FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
	&& pacman -S --noconfirm \
		fuse qt git vim tree ranger python-pip libffi qmk python-pyserial python-pillow \
	&& pacman -U --noconfirm https://archive.archlinux.org/packages/a/avr-gcc/avr-gcc-11.3.0-1-x86_64.pkg.tar.zst

RUN cd /opt/ \
	&& curl -L -o vial.appimage https://github.com/vial-kb/vial-gui/releases/download/v0.7/Vial-v0.7-x86_64.AppImage \
	&& chmod +x vial.appimage

ENTRYPOINT ["/bin/bash"]


