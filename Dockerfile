FROM alpine:edge
ENV NUMBER=1
ENV TITLE=ABC
RUN apk update \
    && apk add lighttpd && apk add gettext \
    && rm -rf /var/cache/apk/*

ADD  htdocs /var/www/localhost/htdocs 

COPY [ "htdocs/index.temp", "/var/www/localhost/htdocs/"]

COPY [ "docker-entrypoint.sh", "/usr/local/bin/" ]

ENTRYPOINT "/usr/local/bin/docker-entrypoint.sh"


#CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

