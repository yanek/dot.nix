#!/usr/bin/env bash

gen="$(date --rfc-3339 s)\n\n$(nixos-rebuild list-generations | rg current)\n$(home-manager generations | head -1)"
git commit -am "$(echo -e $gen)"
git log -n1 --oneline
