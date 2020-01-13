FROM alpine:3.10

ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache --virtual .build-dependencies \
    gcc \
    musl-dev \
    python3-dev && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade \
    pip \
    setuptools \
    wheel \
    flake8 \
    flake8-bugbear \
    black \
    flake8-black && \
    apk del .build-dependencies && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
