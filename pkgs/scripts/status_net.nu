#!/usr/bin/env nu

let connection = nmcli connection show 
| str replace --regex 'Wired connection [0-9]' 'Wired' 
| split row "\n" 
| split column --regex '\s+'
| get 1

let type = $connection | get column3
let ssid = $connection | get column1

if $type == 'wifi' {
  $"($type): ($ssid)"
} else {
  $type
}
