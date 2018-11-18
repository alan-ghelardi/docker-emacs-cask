# Copyright 2018 Alan Ghelardi

#  This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.

#  This program is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License along with
# this program.  If not, see <https://www.gnu.org/licenses/>.

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
