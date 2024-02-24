#!/bin/bash

set -e

source dev-container-features-test-lib

check "deno version" deno --version | grep '1.30.3'

reportResults