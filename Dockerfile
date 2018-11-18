FROM archlinux/base

LABEL maintainer="Alan Ghelardi <alan.ghelardi@gmail.com>"

ARG CASK_VERSION

ARG LEIN_VERSION=2.8.1

RUN pacman -Sy --noconfirm \
base-devel \
emacs-nox \
git \
jdk8-openjdk \
openssh \
python

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/${LEIN_VERSION}/bin/lein \
         --output /usr/bin/lein && \
         chmod +x /usr/bin/lein && \
         lein --version

RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/v${CASK_VERSION}/go | python
ENV PATH=/root/.cask/bin:$PATH
