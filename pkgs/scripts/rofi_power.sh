#!/usr/bin/env bash

print_options() {
  echo "lock"
  echo "reboot"
  echo "shutdown"
  echo "restart xorg"
  exit 0
}

[ $# -eq 0 ] && print_options

case $1 in
"lock")
  slock
  ;;
"reboot")
  systemctl reboot
  ;;
"shutdown")
  systemctl poweroff
  ;;
"restart xorg")
  sudo systemctl restart display-manager
  ;;
*)
  print_options
  ;;
esac
