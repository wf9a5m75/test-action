FROM ubuntu:22.04

USER root

# Install ktlint
RUN apt-get -y update && \
  apt-get -y install build-essential curl git sudo

#RUN apt-get -y install default-jdk
#ENV LANG=C.UTF-8
#ENV JAVA_HOME=/usr/lib/jvm/default-jvm
#ENV PATH=$PATH:/usr/lib/jvm/default-jvm/bin

RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN useradd -m -s /bin/bash linuxbrew && \
  echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers && \
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/linuxbrew/.profile && \
  chown -R linuxbrew:linuxbrew /home/linuxbrew

USER linuxbrew
RUN . /home/linuxbrew/.profile
RUN brew install ktlint && \
  brew cleanup ktlint

COPY ./entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
