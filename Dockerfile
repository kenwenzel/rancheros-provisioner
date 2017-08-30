FROM alpine

RUN apk add --no-cache \
	bash \
        grep \
        openssh \
	&& rm -rf /var/cache/apk/*

ADD scripts scripts

ENTRYPOINT ["bash", "scripts/init.sh"]
