FROM alpine:3.11

RUN apk update & apk upgrade
RUN apk add --no-cache \
  git curl openjdk11 \
  ktlint

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
