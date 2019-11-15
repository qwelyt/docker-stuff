# Libreoffice in a docker container
FROM alpine:latest

RUN apk add \
	libreoffice \
	ttf-dejavu ttf-droid ttf-liberation ttf-cantarell ttf-opensans ttf-ubuntu-font-family \
	font-noto font-noto-extra
	# font-noto-emoji font-noto-cjk font-fira-code

WORKDIR /files/

ENTRYPOINT [ "libreoffice" ]
