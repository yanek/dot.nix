{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./polybar.ini;
    script = ''
      for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
        MONITOR=$m polybar -rq top &
      done
    '';
  };
}
