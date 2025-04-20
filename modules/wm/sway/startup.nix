{ userSettings, ... }:

{
  xsession.windowManager.i3.config.startup = [
    {
      command = "discord";
      always = false;
      notification = false;
    }
    {
      command = ''swaymsg output "*" bg ${userSettings.homeDir}/.nixos-config/modules/themes/${userSettings.theme}/wallpaper.png fill'';
      always = true;
      notification = false;
    }
    {
      command = "sleep 5; systemctl --user start kanshi.service";
      always = false;
      notification = false;
    }
  ];
}
