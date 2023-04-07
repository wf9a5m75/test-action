FROM ubuntu:latest

USER root
RUN <<EOF
  apt update -q
  apt -yq install curl build-essential snapd
  apt clean -y
EOF
RUN snap install ktlint --edge

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
