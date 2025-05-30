#!/usr/bin/env zx

const action = argv._.shift()

switch (action) {
case "lock":
  await $`exec i3lock`
  break
case "reboot":
  await $`systemctl reboot`
  break
case "shutdown":
  await $`systemctl poweroff`
  break
default:
  console.log('lock\nreboot\nshutdown')
}


