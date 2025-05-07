{pkgs}:
pkgs.writeShellScriptBin "run-startup"
''
  swaymsg workspace number 5
  swaymsg exec vesktop
  sleep 1
  swaymsg splith
  swaymsg exec kitty '${pkgs.btop}/bin/btop'
  sleep 1
  swaymsg splitv
  swaymsg exec kitty '${pkgs.cava}/bin/cava'
  sleep 1
  swaymsg splith
  swaymsg exec kitty '${pkgs.tty-clock}/bin/tty-clock -s -c'

  swaymsg workspace number 1
''
