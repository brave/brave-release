#!/usr/bin/env bash

KEY_URL=${KEY_URL:-https://brave-browser-rpm-release.s3.brave.com/brave-core.asc}

wget "$KEY_URL" -O brave-core.asc
