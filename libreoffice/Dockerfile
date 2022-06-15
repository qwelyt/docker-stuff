# Libreoffice in a docker container
FROM alpine:latest

RUN apk add \
	libreoffice \
	ttf-dejavu ttf-droid ttf-liberation ttf-cantarell ttf-opensans ttf-freefont \
	font-noto font-noto-extra \
    terminus-font ttf-inconsolata font-noto-cjk ttf-font-awesome
	# font-noto-emoji font-noto-cjk font-fira-code

WORKDIR /files/

ENTRYPOINT [ "libreoffice" ]
