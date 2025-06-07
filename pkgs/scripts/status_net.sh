#!/usr/bin/env bash

ip addr | rg -v "lo:" | rg "UP" | awk '{print $2" "$9}'
