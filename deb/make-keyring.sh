#!/bin/sh

set -eux

BASE="$PWD/brave-keyring"
KEY_URL="${KEY_URL:-https://brave-browser-apt-release.s3.brave.com/brave-core.asc}"

mkdir -p "${BASE:?}/etc/apt/trusted.gpg.d" "$BASE/usr/share/keyrings"

wget -qO- "${KEY_URL:?}"|tee "$BASE/usr/share/keyrings/brave-browser-release.asc"|\
    gpg --dearmor >"${BASE}/etc/apt/trusted.gpg.d/brave-browser-release.gpg"
