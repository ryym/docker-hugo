# Lightweight Docker image to run Hugo (https://gohugo.io/).

FROM debian:stretch as builder

ENV HUGO_VERSION 0.55.6

# Install dependencies.
RUN apt-get -qq update \
	&& apt-get -qq install -y --no-install-recommends curl ca-certificates

# Install prebuilt Hugo binary.
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb \
    && dpkg -i /tmp/hugo.deb

# Build the final image.
FROM alpine:3.10.3
COPY --from=builder /usr/local/bin/hugo /usr/local/bin/hugo
