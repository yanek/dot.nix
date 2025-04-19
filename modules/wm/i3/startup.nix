{ ... }:

{
  xsession.windowManager.i3.config.startup = [
    {
      # The service usually starts before i3 -- and that's bad
      # Restarting it at startup works around this issue
      command = "systemctl --user restart polybar";
      always = true;
      notification = false;
    }
    {
      command = "autotiling";
      always = false;
      notification = false;
    }
    {
      command = "discord";
      always = false;
      notification = false;
    }
  ];
}
