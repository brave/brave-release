#!/usr/bin/env bash
shopt -s inherit_errexit
set -euEo pipefail

KEYRING_DIR="$PWD/brave-keyring/usr/share/keyrings"

mkdir -p "$KEYRING_DIR"

# Release Key
wget -q https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
     -O "$KEYRING_DIR/brave-browser-archive-keyring.gpg"

# Beta Key
wget -q https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg \
     -O "$KEYRING_DIR/brave-browser-beta-archive-keyring.gpg"

# Nightly Key
wget -q https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg \
     -O "$KEYRING_DIR/brave-browser-nightly-archive-keyring.gpg"
