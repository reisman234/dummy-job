FROM alpine:latest

RUN apk update && apk add coreutils

WORKDIR /app
COPY entrypoint.sh /app

CMD ["/bin/sh", "entrypoint.sh"]
