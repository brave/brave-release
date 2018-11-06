#!/bin/sh

set -eux

BASE="$(pwd)/brave-release-base"
export BASE
mkdir -p output

for dist in xenial yakkety zesty artful bionic; do
    cp -r brave-release-base brave-release-$dist
    sed -i "s/RELEASE/$dist/" brave-release-$dist/etc/apt/sources.list.d/brave-release.sources
    sed -i "s/RELEASE/$dist/" brave-release-$dist/etc/apt/sources.list.d/brave-beta.sources
    sed -i "s/RELEASE/$dist/" brave-release-$dist/etc/apt/sources.list.d/brave-nightly.sources
    dpkg-deb --build brave-release-$dist output/brave-release-$dist.deb
	rm -rf brave-release-$dist
done

