.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


.PHONY: test
test:
	shelltest tests


.PHONY: build-docker-ubuntu
build-docker-ubuntu:
	docker build --no-cache \
		--tag ad-si-ubuntu:latest \
		- < dockerfiles/ubuntu.dockerfile


.PHONY: build-docker-nixos
build-docker-nixos:
	docker build --no-cache \
		--tag ad-si-nixos:latest \
		- < dockerfiles/nixos.dockerfile


.PHONY: build-docker-sai
build-docker-sai:
	docker build --no-cache \
		--tag sai:latest \
		- < dockerfiles/sai.dockerfile


.PHONY: build-docker
build: build-docker-ubuntu build-docker-nixos build-docker-sai
