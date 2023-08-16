#!/bin/sh
set -e

echo "Activating feature 'deno'"

TARGET_DENO_VERSION=${VERSION:-"latest"}

if [ "${TARGET_DENO_VERSION}" = "latest" ] || "${TARGET_DENO_VERSION}" = "none";
then
    curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh
else
    curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh -s "v${TARGET_DENO_VERSION}"
fi
