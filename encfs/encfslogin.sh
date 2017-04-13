#!/bin/bash

set -x

ENCFS="/usr/local/bin/encfs"
ENCFS_XML="$HOME/.crypt/encfs6.xml"
ENCDIR="$HOME/.crypt"
DECDIR="$HOME/crypt"

get_pw () {
  security 2>&1 >/dev/null find-generic-password -ga "encfs" \
  | sed 's/password: "\(.*\)"/\1/'
}

get_pw | ENCFS6_CONFIG="$ENCFS_XML" "$ENCFS" -S "$ENCDIR" "$DECDIR"
