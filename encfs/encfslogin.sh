#!/bin/bash

set -x

ENCFS="/usr/local/bin/encfs"
ENCDIR="$HOME/Sync/crypt"
DECDIR="$HOME/crypt"

get_pw () {
  security 2>&1 >/dev/null find-generic-password -ga "encfs" \
  | sed 's/password: "\(.*\)"/\1/'
}

get_pw | "$ENCFS" -S "$ENCDIR" "$DECDIR"
