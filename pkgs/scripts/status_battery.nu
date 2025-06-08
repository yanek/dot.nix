#!/usr/bin/env nu

let out = acpi -b
| lines
| parse "Battery {idx}: {status}, {percent}%{rest}"
| update status { |row| $row.status | str trim }
| update percent { |row| $row.percent | str trim }
| each { |row|
    let symbol = if $row.status == "Charging" { "(+)" } else { "" }
      $"bat($row.idx): ($row.percent)%($symbol)"
  }
| str join " - "
| str trim

echo $out
