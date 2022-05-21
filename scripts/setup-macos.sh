#!/bin/bash

. "$GITHUB_ACTION_PATH"/scripts/_setup-init.sh

echo "<<$(sw_vers -productVersion)>>"

echo 'Sorry, macOS support is not implemented' >&2
exit 1
