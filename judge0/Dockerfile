FROM debian:buster-slim AS builder

RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends git gcc make libcap-dev pkg-config ca-certificates libc6-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ioi/isolate.git /isolate && \
    cd /isolate && \
    git checkout v2.0 && \
    make isolate

FROM judge0/judge0:latest

USER root
COPY --from=builder /isolate/isolate /usr/local/bin/isolate-real
COPY isolate.cf /usr/local/etc/isolate
COPY isolate-wrapper.sh /usr/local/bin/isolate
RUN chmod 4755 /usr/local/bin/isolate-real && \
    chmod 755 /usr/local/bin/isolate && \
    mkdir -p /run/isolate/locks /var/local/lib/isolate
