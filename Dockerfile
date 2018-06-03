# Litecoin Core
# Copyright (C) 2018 Rodrigo Martínez <dev@brunneis.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM ubuntu:18.04
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

################################################
# LITECOIN CORE
################################################

ARG LITECOIN_CORE_VERSION

RUN \
    apt-get update && apt-get -y upgrade \
    && apt-get -y install \
        wget \
    && wget https://download.litecoin.org/litecoin-$LITECOIN_CORE_VERSION/linux/litecoin-$LITECOIN_CORE_VERSION-x86_64-linux-gnu.tar.gz \
    && tar xf litecoin-$LITECOIN_CORE_VERSION-x86_64-linux-gnu.tar.gz \
    && install -m 0755 -o root -g root -t /usr/local/bin litecoin-$LITECOIN_CORE_VERSION/bin/* \
    && rm -r litecoin-$LITECOIN_CORE_VERSION \
    && rm litecoin-$LITECOIN_CORE_VERSION-x86_64-linux-gnu.tar.gz \
    && apt-get clean

EXPOSE 8333
ENTRYPOINT ["litecoind"]
