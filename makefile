.PHONY: help
help: makefile
	@tail -n +4 makefile | grep ".PHONY"


.PHONY: test
test:
	shelltest tests


.PHONY: build
build:
	docker build \
		--tag ad-si-ubuntu:latest \
		- < dockerfiles/ubuntu.dockerfile

	docker build \
		--tag ad-si-nixos:latest \
		- < dockerfiles/nixos.dockerfile
