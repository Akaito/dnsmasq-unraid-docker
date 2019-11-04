.PHONY: build run stop push test

CONTAINER_NAME := dnsmasq

build: stop
	@-sudo docker stop $(CONTAINER_NAME)
	@-sudo docker rm $(CONTAINER_NAME)
	sudo docker build . \
		-t codesaru/$(CONTAINER_NAME)

push:
	sudo docker push codesaru/dnsmasq:latest

test: stop
	@echo 'USAGE NOTE: edit the below (in the Makefile) to add an `--env EXTRA_PARAMS='--address 8.8.8.8 --server/example.com/192.168.0.42'` or similar.'
	sudo docker run --rm -ti \
		--name $(CONTAINER_NAME) \
		-p 53:53/tcp \
		-p 53:53/udp \
		--cap-add NET_ADMIN \
		codesaru/$(CONTAINER_NAME) --server=8.8.8.8 --address=/example.com/192.168.0.42

run: stop
	sudo docker run --rm \
		--name $(CONTAINER_NAME) \
		-p 53:53/tcp \
		-p 53:53/udp \
		--cap-add NET_ADMIN \
		codesaru/$(CONTAINER_NAME)

stop:
	@-sudo docker stop $(CONTAINER_NAME)
	@-sudo docker rm $(CONTAINER_NAME)

