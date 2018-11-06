#!/bin/sh

set -eux

BASE="$(pwd)/brave-release-base"
export BASE

for dist in xenial yakkety zesty artful bionic; do
    cp -r brave-release-base brave-release-$dist
    sed -i "s/RELEASE/$dist/" brave-release-$dist/etc/apt/sources.list.d/brave.list
    dpkg-deb --build brave-release-$dist brave-release-$dist.deb
	rm -rf brave-release-$dist
done

