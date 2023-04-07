FROM amazoncorretto:17-alpine-jdk

USER root


# Install ktlint
RUN apk -qi update && \
  apk install -qi curl wget

RUN curl -sSL https://api.github.com/repos/pinterest/ktlint/releases/latest  | \
    grep "browser_download_url.*ktlint\"" | \
    cut -d : -f 2,3 | \
    tr -d \" | \
    wget -qi - && \
    chmod a+x ktlint && \
    mv ktlint /usr/local/bin/



COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
