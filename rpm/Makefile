all: rpm-build
build: source
	mock -r fedora-30-x86_64 \
		--source=brave-keyring-source.tar.gz \
		--spec=brave-keyring.spec \
		--rebuild \
		--old-chroot \
		--resultdir=output

keys:
	./make-keyring.sh
	cp brave-core.asc brave-keyring-1.7/etc/pki/rpm-gpg/RPM-GPG-KEY-brave

source: keys
		tar cvzf brave-keyring-source.tar.gz brave-keyring-*/*

clean:
		rm -rf output brave-keyring-source.tar.gz brave-keyring-*/etc/pki/rpm-gpg/*
		docker rmi rpm-builder

docker-build:
	docker build -t rpm-builder .

rpm-build: docker-build
	docker run --rm -ti -v $(shell pwd):/brave-release --security-opt apparmor:unconfined --cap-add=SYS_ADMIN rpm-builder
