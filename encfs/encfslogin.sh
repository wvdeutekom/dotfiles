#!/bin/bash

set -euxo pipefail

ENCFS="/usr/local/bin/encfs"

function get_pw() {
  security 2>&1 >/dev/null find-generic-password -ga "$1" | head -1 | sed 's/password: "\(.*\)"/\1/'
}

get_pw "encfs" | ENCFS6_CONFIG="$HOME/.crypt/encfs6.xml" "$ENCFS" -S "$HOME/.crypt" "$HOME/crypt"
get_pw "encfs_photos" | ENCFS6_CONFIG="$HOME/Pictures/.picture_crypt/encfs6.xml" "$ENCFS" -S "$HOME/Pictures/.picture_crypt" "$HOME/Pictures/personal"
