#!/usr/bin/env bash

set -e

echo "Staging files..."
git add .
git diff --staged --name-status

echo "Generating git commit..."
gen="$(date --rfc-3339 s)\n\n$(nixos-rebuild list-generations | rg current)\n$(home-manager generations | head -1)"
git commit -m "$(echo -e $gen)" &>git.log || (
  bat git.log | rg error && false
)
git log -n1 --oneline
