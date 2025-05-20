{
  xsession.windowManager.i3.config = {
    workspaceAutoBackAndForth = true;

    window.commands = [
      {
        command = "floating enable";
        criteria.class = "pavucontrol";
      }
      {
        command = "floating enable";
        criteria.class = "easyeffects";
      }
    ];

    assigns = {
      "2" = [{class = "steam";}];
      "5" = [{class = "vesktop";}];
      "6" = [{class = "Spotify";}];
    };
  };
}
