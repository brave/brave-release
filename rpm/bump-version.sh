#!/usr/bin/env bash

set -x
export VERSION=$(cat VERSION)
export OLDVER=${VERSION}
export MAJOR=$(echo ${VERSION} | cut -d'.' -f1)
export MINOR=$(echo ${VERSION} | cut -d'.' -f2)
export MINOR=$((MINOR+1))
export VERSION="${MAJOR}.${MINOR}"
echo ${VERSION}>VERSION
git mv brave-keyring-${OLDVER} brave-keyring-${VERSION}

# Set sed in-place flag based on OS (empty string for macOS, nothing for Linux)
if [[ "$(uname)" == "Darwin" ]]; then
  SED_INPLACE_FLAG=(-i '')
else
  SED_INPLACE_FLAG=(-i)
fi
sed "${SED_INPLACE_FLAG[@]}" -e '/^Version:/ s/'"${OLDVER}"'/'"${VERSION}"'/' brave-keyring.spec
