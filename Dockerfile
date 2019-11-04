FROM alpine:latest
RUN apk --no-cache add dnsmasq

#RUN addgroup -S dnsmasqdocker && adduser -G dnsmasqdocker -S -D dnsmasqdocker
#USER dnsmasq:dnsmasq

ENTRYPOINT exec dnsmasq -k --no-resolv --no-poll $ADDITIONAL_PARAMS

