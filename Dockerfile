FROM caliahub/alpine:3.11.5

MAINTAINER Calia "cnboycalia@gmail.com"

RUN apk add --no-cache \
        libstdc++ \
    && apk add --no-cache --virtual .build-deps \
        binutils-gold \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python \
        wget \
    && wget "https://nodejs.org/dist/v10.16.1/node-v10.16.1.tar.xz" \
    && tar -xf "node-v10.16.1.tar.xz" \
    && cd "node-v10.16.1" \
    && ./configure \
    && make \
    && make install \
    && apk del .build-deps \
    && cd .. \
    && rm -Rf "node-v10.16.1" \
    && rm "node-v10.16.1.tar.xz"

CMD ["node"]
