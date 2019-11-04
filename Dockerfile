FROM alpine:latest
RUN apk --no-cache add dnsmasq

RUN addgroup -S dnsmasqdocker \
    && adduser -G dnsmasqdocker -S -D dnsmasqdocker
USER dnsmasqdocker:dnsmasqdocker

#ENTRYPOINT ["dnsmasq", "-k"]
ENTRYPOINT exec dnsmasq -k $EXTRA_PARAMS

