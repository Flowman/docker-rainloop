FROM alpine:latest

MAINTAINER Peter Szalatnay <theotherland@gmail.com>

RUN \
    apk add --update \
        curl \
    && rm -fr /var/cache/apk/* \
    && mkdir -p /opt/www/webmail/data \
    && curl -o rainloop.zip -SL http://repository.rainloop.net/v2/webmail/rainloop-latest.zip \
    && unzip rainloop.zip -d /opt/www/webmail \
    && rm rainloop.zip \
    && chown -Rf 33.33 /opt/www/webmail

COPY ./default /etc/nginx/sites-enabled/default

VOLUME ["/opt/www/webmail", "/etc/nginx/sites-enabled"]