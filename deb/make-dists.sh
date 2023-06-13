#!/usr/bin/env bash
shopt -s inherit_errexit
set -eEo pipefail

VERSION=$(cat brave-keyring/DEBIAN/control |grep "^Version"|awk '{ print $2 }')
fakeroot dpkg-deb --build brave-keyring output/brave-keyring_$VERSION-1.deb
chown -R $TARGET_UID:$TARGET_GID output/
