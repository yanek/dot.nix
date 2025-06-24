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
    command = "${getExe pkgs.xmousepasteblock}";
  }
  {
    command = "slock";
  }
  {
    # Set the desktop background to a solid color, based on the applied color scheme.
    command = "${getExe' pkgs.hsetroot "hsetroot"} -solid \"${color.base02}\"";
    always = true;
  }
]
++ config.myHome.windowManager.i3.extraStartupPrograms
