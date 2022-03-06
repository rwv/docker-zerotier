ARG ALPINE_VERSION=edge

FROM alpine:${ALPINE_VERSION}

ARG ZT_VERSION=1.8.4-r0

LABEL maintainer="seedgou <seedgou@gmail.com>"

RUN apk add --no-cache zerotier-one=${ZT_VERSION}

ENTRYPOINT ["/usr/sbin/zerotier-one"]
