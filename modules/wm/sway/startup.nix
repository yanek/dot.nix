{userSettings, ...}: {
  wayland.windowManager.sway.config.startup = [
    {
      command = "discord";
      always = false;
    }
    {
      command = ''swaymsg output "*" bg ${userSettings.dirs.theme}/wallpaper.png fill'';
      always = true;
    }
    # {
    #   command = "sleep 5; systemctl --user start kanshi.service";
    #   always = false;
    # }
  ];
}
