all: deb-build

clean:
	rm -rf output brave-keyring/etc/apt/trusted.gpg.d/* brave-keyring/usr
	docker rmi -f deb-builder

docker-build:
	docker build -t deb-builder .

deb-build: docker-build
	docker run --rm -ti -e TARGET_UID=$(shell id -u) -e TARGET_GID=$(shell id -g) -v $(shell pwd):/brave-release deb-builder make -C /brave-release build

build:
	mkdir -p output
	bash make-keyring.sh
	bash make-dists.sh

bump:
	./bump-version.sh
