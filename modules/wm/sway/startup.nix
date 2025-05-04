{userSettings, ...}: {
  wayland.windowManager.sway.config.startup = [
    {
      command = "webcord";
      always = false;
    }
    {
      command = ''swaymsg output "*" bg ${userSettings.dirs.theme}/wallpaper.png fill'';
      always = true;
    }
  ];
}
