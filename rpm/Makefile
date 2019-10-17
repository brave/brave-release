all: rpm-build
build: source
		for dist in epel-8-x86_64 \
				    fedora-29-x86_64 \
					fedora-30-x86_64 ; do \
				mock -r $$dist \
				     --buildsrpm \
					 --source=brave-keyring-source.tar.gz \
					 --spec=brave-keyring.spec \
					 --rebuild \
					 --old-chroot \
					 --resultdir=output ; \
		done

keys:
		wget https://brave-browser-apt-release.s3.brave.com/brave-core.asc -O brave-keyring-1.4/etc/pki/rpm-gpg/RPM-GPG-KEY-brave

source: keys
		tar cvzf brave-keyring-source.tar.gz brave-keyring-*/*

clean:
		rm -rf output brave-keyring-source.tar.gz brave-keyring-*/etc/pki/rpm-gpg/*
		docker rmi rpm-builder

docker-build:
	docker build -t rpm-builder .

rpm-build: docker-build
	docker run --rm -ti -v $(shell pwd):/brave-release --cap-add=SYS_ADMIN rpm-builder
