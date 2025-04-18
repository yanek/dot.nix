{ ... }:

{
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./polybar.ini;
    script = ''
      killall -q polybar
      while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
      polybar -rq top &
    '';
  };
}
