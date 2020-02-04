#!/usr/bin/env bash

KEY_URL=${KEY_URL:-https://brave-browser-rpm-release.s3.brave.com/brave-core.asc}

if [ ! -f brave-core.asc ]; then
  echo "No public key file (./brave-core.asc) detected in present working directory. Downloading)"
  wget "$KEY_URL" -O brave-core.asc
fi
