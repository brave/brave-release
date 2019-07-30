#!/bin/sh

set -eux

dpkg-deb --build brave-keyring output/brave-keyring.deb
