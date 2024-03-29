#!/bin/sh
set -e

apt_get_update() {
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

check_packages curl unzip ca-certificates

echo "Activating feature 'deno'"

TARGET_DENO_VERSION=${VERSION:-"latest"}
MIN_ARM_SUPPORT_VERSION="1.41.0"
COMPARE_MIN_VERSION=$(echo -e "${TARGET_DENO_VERSION}\n${MIN_ARM_SUPPORT_VERSION}" | sort -V | head -n1)

if [ "${TARGET_DENO_VERSION}" = "latest" ] || [ "${TARGET_DENO_VERSION}" = "none" ];
then
    curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh
elif [ "${TARGET_DENO_VERSION}" = "${MIN_ARM_SUPPORT_VERSION}" ] || [ "${COMPARE_MIN_VERSION}" = "${MIN_ARM_SUPPORT_VERSION}" ];
then
    curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh -s "v${TARGET_DENO_VERSION}"
else
    curl -fsSL https://gist.githubusercontent.com/LukeChannings/09d53f5c364391042186518c8598b85e/raw/ac8cd8c675b985edd4b3e16df63ffef14d1f0e24/deno_install.sh | DENO_INSTALL=/usr/local sh -s "v${TARGET_DENO_VERSION}"
fi
