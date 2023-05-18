#!/usr/bin/env bash
shopt -s inherit_errexit
set -eEo pipefail

# Cleanup current dir
rm -f RPM-GPG-KEY-brave*

# Release Key
wget -q https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -O RPM-GPG-KEY-brave

# Beta Key
wget -q https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc -O RPM-GPG-KEY-brave-beta

# Nightly Key
wget -q https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc -O RPM-GPG-KEY-brave-nightly
