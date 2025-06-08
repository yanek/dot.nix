#!/usr/bin/env nu        

let sink = "@DEFAULT_AUDIO_SINK@"

let val = wpctl get-volume $sink
| parse "Volume: {value}"
| update value { |row| ($row.value | into float) * 100 | into string } 
| first
| get value

$"volume: ($val)%"
