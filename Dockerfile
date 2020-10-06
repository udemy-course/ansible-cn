FROM python:3.8.5-alpine3.12

RUN apk add --no-cache gcc libressl-dev musl-dev libffi-dev openssh-client openssl-dev python3-dev alpine-sdk autoconf automake libtool&& \
    pip install --upgrade pip && \
    pip install --no-cache-dir ansible ansible-lint pycrypto&& \
    apk del gcc libressl-dev musl-dev libffi-dev openssl-dev python3-dev alpine-sdk autoconf automake libtool

WORKDIR /app

VOLUME ["/app"]

CMD []