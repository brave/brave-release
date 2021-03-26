#!/bin/sh -e

BASE="$PWD/brave-keyring"

mkdir -p "$BASE/usr/share/keyrings"

wget -q https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
     -O "${BASE}/usr/share/keyrings/brave-browser-archive-keyring.gpg"
