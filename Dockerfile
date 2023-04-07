FROM amazoncorretto:17-alpine-jdk

USER root


# Install ktlint
RUN apk update && \
  apk add --update alpine-sdk

RUN brew update

#RUN curl -sSL https://api.github.com/repos/pinterest/ktlint/releases/latest  | \
#    grep "browser_download_url.*ktlint\"" | \
#    cut -d : -f 2,3 | \
#    tr -d \" | \
#    wget -qi - && \
#    chmod a+x ktlint && \
#    mv ktlint /usr/local/bin/



COPY entrypoint.sh /root/entrypoint.sh
RUN chmod a+x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
