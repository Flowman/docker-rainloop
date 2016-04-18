FROM alpine:latest

MAINTAINER Peter Szalatnay <theotherland@gmail.com>

RUN \
    addgroup -S nginx \
    && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
    && apk add --update \
        curl \
    && rm -fr /var/cache/apk/* \
	&& curl -o rainloop.zip -SL http://repository.rainloop.net/v2/webmail/rainloop-latest.zip \
	&& unzip rainloop.zip -d /opt/www/webmail \
	&& rm rainloop.zip \
	&& chown -Rf nginx.nginx /opt/www/webmail

VOLUME ["/opt/www/webmail"]