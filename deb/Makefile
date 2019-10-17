all: deb-build

clean:
	rm -rf output brave-keyring/etc/apt/trusted.gpg.d/* *.asc
	docker rmi deb-builder

docker-build:
	docker build -t deb-builder .

deb-build: docker-build
	docker run --rm -ti -e TARGET_UID=$(shell id -u) -e TARGET_GID=$(shell id -g) -v $(shell pwd):/brave-release deb-builder make -C /brave-release build

build:
	mkdir -p output
	sh make-keyring.sh
	sh make-dists.sh
