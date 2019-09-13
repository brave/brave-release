all:
	mkdir -p output
	sh make-keyring.sh
	sh make-dists.sh

clean:
	rm -rf output brave-keyring/etc/apt/trusted.gpg.d/* *.asc
