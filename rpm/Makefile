all: rpm-build
build: source
	mock -r fedora-30-x86_64 \
		--source=brave-keyring-source.tar.gz \
		--spec=brave-keyring.spec \
		--rebuild \
		--isolation=simple \
		--resultdir=output

bump:
	./bump-version.sh

keys:
	./make-keyring.sh
	set -x; VERSION=`cat VERSION`; cp RPM-GPG-KEY-brave* brave-keyring-$${VERSION}/etc/pki/rpm-gpg/

source: keys
		tar cvzf brave-keyring-source.tar.gz brave-keyring-*/*

clean:
		rm -rf output brave-keyring-source.tar.gz brave-keyring-*/etc/pki/rpm-gpg/*
		docker rmi rpm-builder

docker-build:
	docker build -t rpm-builder .

rpm-build: docker-build
	docker run --rm -v $(shell pwd):/brave-release --security-opt apparmor:unconfined --cap-add=SYS_ADMIN rpm-builder
