ARG SAMBA_VERSION=4.15.7

FROM alpine:3.16

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Please specify it before run
WORKDIR /srv/docker/samba/build

ARG SAMBA_VERSION
ARG SAMBA_RELEASE
RUN apk --update --no-cache add \
    bash \
    coreutils \
    jq \
    samba=${SAMBA_VERSION}-r0 \
    shadow \
    tzdata \
    yq \
  && rm -rf /tmp/*

COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /data
COPY config.yml /data/
RUN chmod +x /entrypoint.sh

#EXPOSE 445
EXPOSE 137/udp 138/udp 135/tcp 139/tcp 445/tcp

#VOLUME [ "/data" ]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "smbd", "-F", "--debug-stdout", "--no-process-group" ]

HEALTHCHECK --interval=30s --timeout=10s \
  CMD smbclient -L \\localhost -U % -m SMB3
