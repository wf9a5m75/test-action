FROM archlinux:latest

USER root

RUN pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com && \
    pacman-key --init && \
    pacman-key --lsign-key FBA220DFC880C036 && \
    pacman --noconfirm -U \
      'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
      'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && \
    echo '[chaotic-aur]' >> /etc/pacman.conf && \
    echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# Install ktlint
RUN pacman -Sy --noconfirm ktlint

COPY ./entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
