FROM archlinux/base

ARG CASK_VERSION

ARG LEIN_VERSION=2.8.1

RUN pacman -Sy --noconfirm \
base-devel \
git \
openssh \
jdk8-openjdk \
python \
emacs-nox

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/${LEIN_VERSION}/bin/lein \
         --output /usr/bin/lein && \
         chmod +x /usr/bin/lein && \
         lein --version

RUN curl -fsSL https://raw.githubusercontent.com/cask/cask/v${CASK_VERSION}/go | python
ENV PATH=/root/.cask/bin:$PATH
