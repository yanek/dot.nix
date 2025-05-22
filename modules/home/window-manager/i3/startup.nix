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
  {
    command = "${pkgs.flashfocus}/bin/flashfocus --simple --time 100";
  }
]
++ config.myHome.windowManager.i3.extraStartupPrograms
