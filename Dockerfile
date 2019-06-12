FROM alpine:3.9

ENV SECRET=recall

COPY conf-copy /conf-copy

RUN apk update &&  \
    apk add --no-cache --update bash git aria2 wget darkhttpd && \
    mkdir -p /conf &&  \
    mkdir -p /data &&  \
    mkdir -p /aria2ng &&  \
    cd /aria2ng && \
    wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.0.0/AriaNg-1.0.0.zip && \
    unzip AriaNg-1.0.0.zip && rm -rf AriaNg-1.0.0.zip  &&  \
    apk del git && \
    rm -rf /var/cache/*/*

RUN chmod +x /conf-copy/start.sh

VOLUME [ "/data", "/conf" ]
EXPOSE 80 6800
ENTRYPOINT [ "/conf-copy/start.sh" ]
