FROM amazoncorretto:17.0.3-alpine as corretto-jdk

USER root


# Install ktlint
RUN <<EOF
curl -sSL https://api.github.com/repos/pinterest/ktlint/releases/latest | \
  grep "browser_download_url.*ktlint\"" | \
  cut -d : -f 2,3 | \
  tr -d \" | \
  wget -qi - &&
  chmod a+x ktlint &&
  mv ktlint /usr/local/bin/
EOF

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
