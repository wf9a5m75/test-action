FROM ubuntu:latest

USER root
RUN <<EOF
  apt update -q
  apt -yq install curl
  apt clean -y
  snap install ktlint
EOF

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
