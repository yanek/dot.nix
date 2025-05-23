{
  config,
  pkgs,
  ...
}:
[
  {
    command = "xsetroot -cursor_name left_ptr";
  }
  {
    command = "xsetroot -solid \"${config.lib.stylix.colors.withHashtag.base02}\"";
    always = true;
  }
  {
    command = "systemctl --user restart polybar";
    always = true;
  }
  {
    command = "${pkgs.flashfocus}/bin/flashfocus --simple --time 100";
  }
]
++ config.myHome.windowManager.i3.extraStartupPrograms
