FROM alpine:3.10

WORKDIR /tmp
COPY entrypoint.sh /entrypoint.sh

RUN apk update \
    && apk add --no-cache openssl \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
