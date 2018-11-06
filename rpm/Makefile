all: source
		mkdir -p rpmbuild/SOURCES \
				 rpmbuild/SPECS \
				 rpmbuild/BUILD \
				 rpmbuild/BUILDROOT \
				 rpmbuild/SRPMS \
				 rpmbuild/RPMS
		rpmbuild --define '_topdir $(shell pwd)/rpmbuild' -bb brave-release.spec

source:
		tar cvzf rpmbuild/SOURCES/brave-release-source.tar.gz brave-release-1.0/*

clean:
		rm -f rpmbuild/RPMS/*.rpm \
		      rpmbuild/SOURCES/*
