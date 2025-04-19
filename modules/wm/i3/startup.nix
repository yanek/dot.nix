{ ... }:

{
  xsession.windowManager.i3.config.startup = [
    {
      always = true;
      command = "systemctl --user restart polybar";
    }
  ];
}
