#!/bin/sh

set -eux

VERSION=$(cat brave-keyring/DEBIAN/control |grep "^Version"|awk '{ print $2 }')
dpkg-deb --build brave-keyring output/brave-keyring_$VERSION-1.deb
chown -R $TARGET_UID:$TARGET_GID output/
