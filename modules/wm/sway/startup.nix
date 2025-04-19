{ ... }:

{
  xsession.windowManager.i3.config.startup = [
    {
      command = "discord";
      always = false;
      notification = false;
    }
    {
      command = "sleep 5; systemctl --user start kanshi.service";
      always = false;
      notification = false;
    }
  ];
}
