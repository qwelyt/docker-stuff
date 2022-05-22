# OpenScad in a docker container
FROM archlinux:base

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
	openscad \
	ttf-dejavu ttf-droid 
    #ttf-liberation ttf-cantarell ttf-opensans ttf-ubuntu-font-family \
	# font-noto font-noto-extra
	# font-noto-emoji font-noto-cjk font-fira-code

WORKDIR /files/

ENTRYPOINT [ "openscad" ]
#ENTRYPOINT [ "bash" ]
