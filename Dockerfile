FROM alpine:3.9 AS build
#
# Copyright (c) 2018 Cryply developers
# Distributed under the MIT/X11 software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.
#
LABEL maintainer "Cryptomorpher <cryptomorpher@gmail.com>"

WORKDIR /src

RUN apk update \
      && apk add --no-cache \
      alpine-sdk autoconf libtool automake boost-dev openssl-dev db-dev git libevent-dev \
      && git clone https://github.com/cranepay/cranepay-core.git cranepay \
      && cd cranepay            \
      && ./autogen.sh         \
      && ./configure          \
      --enable-upnp-default   \
      --without-gui           \
      --disable-tests         \
      --with-incompatible-bdb \
      && make -j$(nproc)      \
      && make install

FROM alpine:3.9

COPY --from=build /usr/local/bin/cranepayd    /usr/local/bin/cranepayd
COPY --from=build /usr/local/bin/cranepay-cli /usr/local/bin/cranepay-cli

RUN apk add --no-cache db-c++ boost boost-program_options openssl libevent-dev

ADD ./entrypoint.sh /entrypoint.sh

VOLUME /data

WORKDIR /data

ADD ./cranepay.conf /data/cranepay.conf

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 48886 48887

CMD ["cranepayd"]

