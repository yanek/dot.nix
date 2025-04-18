{ ... }:

{
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./polybar.ini;
    script = ''
      polybar -rq top
    '';
  };
}
