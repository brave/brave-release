#!/bin/sh

set -eux

export BASE=$(pwd)/brave-release-base

export GNUPGHOME=${BASE}/etc/apt/trusted.gpg.d

#wget https://brave-browser-apt-release.s3.brave.com/brave-old.asc
wget https://brave-browser-apt-release.s3.brave.com/brave-core.asc
#gpg --no-default-keyring --keyring brave.gpg --import brave-old.asc
gpg --no-default-keyring --keyring brave.gpg --import brave-core.asc
rm -f ${BASE}/etc/apt/trusted.gpg.d/trustdb.gpg \
      ${BASE}/etc/apt/trusted.gpg.d/secring.gpg \
      brave-core.asc
