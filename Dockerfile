FROM python:3.8-alpine

RUN apk update && apk add coreutils

WORKDIR /app
COPY entrypoint.sh /app

CMD ["/bin/sh", "entrypoint.sh"]
