#!/usr/bin/env zx

const action = process.argv.slice(3).shift();

switch (action) {
  case "lock":
    await $`exec i3lock`;
    break;
  case "reboot":
    await $`systemctl reboot`;
    break;
  case "shutdown":
    await $`systemctl poweroff`;
    break;
  case "restart X11 server":
    await $`sudo systemctl restart display-manager`;
  default:
    console.log("lock\nreboot\nshutdown\nrestart X11 server");
}
