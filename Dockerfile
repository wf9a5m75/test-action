FROM alpine

USER root
RUN apk --no-cache update & apk --no-cache upgrade

RUN apk add bash build-base curl file git gzip libc6-compat ncurses ruby ruby-dbm ruby-etc ruby-irb ruby-json sudo printf grep

RUN apacman -S --needed base-devel
RUN git clone https://aur.archlinux.org/paru.git
RUN cd paru && \
  makepkg -si
RUN paru ktlint

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
