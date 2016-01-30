#!/bin/bash
set -e

if [ "$1" = 'shellcheck' ]
then
    cd /shellcheck
    export LANG=C.UTF-8
    cabal update
    cabal install
    if mountpoint -q /target; then
        echo "Installing shellcheck to /target"
        cp /root/.cabal/bin/shellcheck /target
    else
        echo "/target is not a mountpoint."
        echo "You can either:"
        echo "- re-run this container with -v /usr/local/bin:/target"
        echo "- extract the shellcheck binary (located at /root/.cabal/bin/shellcheck)"
    fi
else
  exec "$@"
fi
