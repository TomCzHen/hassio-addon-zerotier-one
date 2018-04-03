ARG BUILD_FROM=hassioaddons/base-amd64:1.3.3
FROM ${BUILD_FROM}

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Copy root filesystem
ARG BUILD_ARCH=amd64
COPY rootfs /
COPY bin/${BUILD_ARCH} /usr/bin

RUN ln -s /usr/bin/zerotier-one /usr/bin/zerotier-cli \
  && addgroup -g 1000 -S zerotier-one \
  && adduser -D -u 1000 -S -h /data -H zerotier-one -G zerotier-one

# Labels
LABEL \
    io.hass.name="zerotier" \
    io.hass.description="ZeroTier for Hass.io" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Tom Czhen <tom.czhen@gmail.com>" \
    org.label-schema.description="ZeroTier for Hass.io" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="ZeroTier" \
    org.label-schema.schema-version="1.6" \
    org.label-schema.url="https://coding.net/u/tomczhen/p/hassio-addons/git" \
    org.label-schema.usage="https://coding.net/u/tomczhen/p/hassio-addons/git/blob/master/zerotier/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://coding.net/u/tomczhen/p/hassio-addons/git" \
    org.label-schema.vendor="Tom Czhen Hass.io Addons"