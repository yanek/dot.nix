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
  programs =
    [
      "xsetroot -cursor_name left_ptr"
      monitorOrderCommand
      "${pkgs.feh}/bin/feh --bg-fill ${config.stylix.image}"
      "systemctl --user restart polybar"
    ]
    ++ config.myHome.windowManager.bspwm.extraStartupPrograms;
}
