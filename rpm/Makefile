all: source
		for dist in epel-7-x86_64 \
				    fedora-27-x86_64 \
				    fedora-28-x86_64 \
				    fedora-29-x86_64 \
					fedora-30-x86_64 ; do \
				mock -r $$dist \
				     --buildsrpm \
					 --source=brave-release-source.tar.gz \
					 --spec=brave-release.spec \
					 --rebuild \
					 --resultdir=output ; \
		done

source:
		tar cvzf brave-release-source.tar.gz brave-release-1.0/*

clean:
		rm -rf output brave-release-source.tar.gz
