FROM amazoncorretto:17-alpine-jdk

USER root


# Install ktlint
RUN apk update && \
  apk add --update alpine-sdk

RUN /bin/bash -c "$(yes '' | curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile

USER linuxbrew

RUN brew doctor

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
