ARG ALPINE_VERSION=3.20.0
FROM alpine:${ALPINE_VERSION}

RUN --mount=type=cache,target=/var/cache/apk/ \
  apk --update add \
  nginx \
  ca-certificates \
  tzdata \
  && \
  update-ca-certificates

CMD [ "nginx", "-g", "daemon off;" ]
