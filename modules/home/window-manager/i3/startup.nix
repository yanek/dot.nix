{
  config,
  pkgs,
  lib,
}:
let
  inherit (lib) getExe getExe';
  color = config.lib.stylix.colors.withHashtag;
in
[
  {
    # Make the cursor work, even when hovering the desktop.
    command = "xsetroot -cursor_name left_ptr";
  }
  {
    command = "${getExe pkgs.betterlockscreen} --lock blur --display 1";
  }
  {
    # Set the desktop background to a solid color, based on the applied color scheme.
    command = "${getExe' pkgs.hsetroot "hsetroot"} -solid \"${color.base02}\"";
    always = true;
  }
  {
    # Needed because workspace doesn't work otherwise.
    # TODO: check if we can do something about the home manager module to start the service later.
    command = "systemctl --user restart polybar";
    always = true;
  }
]
++ config.myHome.windowManager.i3.extraStartupPrograms
