{
  pkgs,
  userSettings,
  ...
}: let
  startup-script = import ../../../packages/scripts/run-startup.nix {inherit pkgs;};
in {
  wayland.windowManager.sway.config.startup = [
    {
      command = "swaylock";
      always = false;
    }
    {
      command = "systemctl --user enable --now waybar";
      always = false;
    }
    {
      command = "openrgb -m static -c cd3c0a";
      always = true;
    }
    {
      command = "${startup-script}/bin/run-startup";
      always = false;
    }
    {
      command = ''swaymsg output "*" bg ${userSettings.dirs.theme}/wallpaper.png fill'';
      always = true;
    }
  ];
}
