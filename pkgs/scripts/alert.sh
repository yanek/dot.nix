#!/usr/bin/env bash

# TODO: Change this to another directory,
# and copy the file in the nix derivation
AUDIOFILE="/home/nk/.nixos-config/pkgs/scripts/alert.mp3"

pw-play $AUDIOFILE
