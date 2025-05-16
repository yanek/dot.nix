{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  monitorOrder = strings.concatStringsSep " " config.myHome.windowManager.bspwm.monitors;
  monitorOrderCommand =
    if config.myHome.windowManager.bspwm.monitors != []
    then "bspc wm --reorder-monitors ${monitorOrder}"
    else "";
in {
  xsession.windowManager.bspwm.startupPrograms = [
    "xsetroot -cursor_name left_ptr"
    monitorOrderCommand
    "${pkgs.feh}/bin/feh --bg-fill ${config.stylix.image}"
    "systemctl --user restart polybar"
    "spotify"
    "sleep 5 && vesktop"
    "sleep 5 && openrgb -m static -c cd3c0a"
  ];
}
