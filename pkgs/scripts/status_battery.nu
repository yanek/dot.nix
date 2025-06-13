#!/usr/bin/env nu

let data = acpi -b
| lines
| parse "Battery {idx}: {status}, {percent}%{rest}"
| update status { |row| $row.status | str trim }
| update percent { |row| $row.percent | str trim }

let on_ac = $data | any { |el| $el.status == "Charging" }
let charge_indicator = if ($on_ac) {"+"} else {""}
let charge_value = $data.percent | into int | math avg | math floor

echo $"bat: ($charge_value)%($charge_indicator)";
