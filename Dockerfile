FROM alpine:3.4

RUN apk add --no-cache \
	bash \
	&& rm -rf /var/cache/apk/*

ADD scripts scripts

ENTRYPOINT ["bash", "scripts/init.sh"]
