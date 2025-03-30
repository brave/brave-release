deb-build-arm: platform = linux/arm64
deb-build: platform = linux/amd64

all: deb-build

clean:
	rm -rf output brave-keyring/etc/apt/trusted.gpg.d/* brave-keyring/usr
	docker rmi -f deb-builder

docker-build:
	docker build --platform ${platform} -t deb-builder .

deb-build: docker-build
	docker run --rm -e TARGET_UID=$(shell id -u) -e TARGET_GID=$(shell id -g) -v $(shell pwd):/brave-release deb-builder make -C /brave-release build

deb-build-arm: deb-build docker-build

build:
	mkdir -p output
	./make-keyring.sh
	./make-dists.sh

bump:
	./bump-version.sh
