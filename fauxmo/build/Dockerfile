FROM alpine

# ENV PATH="/container/scripts:${PATH}"

RUN apk add --no-cache python3 \
                       py3-pip \
                       git \
                       curl \
\
&& pip install --upgrade pip \
&& pip install fauxmo \
\
&& mkdir /etc/fauxmo/ \
\
&& git clone https://github.com/n8henrie/fauxmo-plugins /fauxmo-plugins \
&& rm -rf /fauxmo-plugins/.git \
\
&& apk del --no-cache git

RUN mkdir -p /scripts
COPY ./scripts /scripts
RUN chmod +x /scripts/*

HEALTHCHECK CMD ["/scripts/docker-healthcheck.sh"]
ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD [ "fauxmo" ]
