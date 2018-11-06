all:
	sh make-keyring.sh
	dpkg-deb --build brave-release/

clean:
	rm -f brave-release.deb brave-release/etc/apt/trusted.gpg.d/*
