FROM ubuntu:latest

USER root
RUN <<EOF
  apt-get update -q
  apt-get -yq install curl
  apt-get clean -y
  snap install ktlint
EOF

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
