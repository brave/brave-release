#!/bin/sh

set -eux

dpkg-deb --build brave-keyring output/brave-keyring.deb
chown -R $TARGET_UID:$TARGET_GID output/
