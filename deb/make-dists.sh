#!/bin/sh

set -eux

BASE="$(pwd)/brave-keyring"
export BASE
mkdir -p output


########################################################################
# Use this section when we move to a single suite for all our releases #
########################################################################

#cp -r brave-keyring brave-keyring
#sed -i "s/RELEASE/stable/" brave-keyring/etc/apt/sources.list.d/brave-keyring.sources
#sed -i "s/RELEASE/stable/" brave-keyring/etc/apt/sources.list.d/brave-beta.sources
#sed -i "s/RELEASE/stable/" brave-keyring/etc/apt/sources.list.d/brave-nightly.sources
#dpkg-deb --build brave-keyring output/brave-keyring.deb
#rm -rf brave-keyring

#############################################################################
# Use this section when we need to make a single package per distro release #
#############################################################################

for dist in xenial yakkety zesty artful bionic; do
    cp -r "${BASE}" "${BASE}-$dist"
    sed -i "s/RELEASE/$dist/" "${BASE}-$dist/etc/apt/sources.list.d/brave-release.sources"
    sed -i "s/RELEASE/$dist/" "${BASE}-$dist/etc/apt/sources.list.d/brave-beta.sources"
    sed -i "s/RELEASE/$dist/" "${BASE}-$dist/etc/apt/sources.list.d/brave-nightly.sources"
    dpkg-deb --build "${BASE}-$dist" output/brave-keyring-$dist.deb
	rm -rf brave-keyring-$dist
done

