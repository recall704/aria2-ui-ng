FROM alpine:3.9


ENV SECRET=recall

RUN apk update &&  \
    apk add --no-cache --update bash &&  \
    mkdir -p /conf &&  mkdir -p /conf-copy &&  \
    mkdir -p /data &&  apk add --no-cache --update aria2 &&  \
    mkdir -p /aria2ng &&  \
    cd /aria2ng &&  apk add --no-cache --update wget &&  \
    wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.0.0/AriaNg-1.0.0.zip && \
    unzip AriaNg-1.0.0.zip && rm -rf AriaNg-1.0.0.zip  &&  \
    apk del wget &&  apk add --update darkhttpd

COPY conf-copy /conf-copy

RUN chmod +x /conf-copy/start.sh

VOLUME [ "/data", "/conf" ]
EXPOSE 80 81 8080 6800
ENTRYPOINT [ "/conf-copy/start.sh" ]