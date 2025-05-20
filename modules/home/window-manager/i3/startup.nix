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
    command = "${pkgs.feh}/bin/feh --bg-fill ${config.stylix.image}";
    always = true;
  }
  {
    command = "systemctl --user restart polybar";
    always = true;
  }
]
++ config.myHome.windowManager.i3.extraStartupPrograms
