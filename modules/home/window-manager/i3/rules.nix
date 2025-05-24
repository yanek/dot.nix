{
  window = [
    {
      command = "floating enable";
      criteria.class = "pavucontrol";
    }
    {
      command = "floating enable";
      criteria.class = "easyeffects";
    }
    {
      command = "floating enable";
      criteria.title = "^Cameractrls$";
    }
  ];

  assigns = {
    "2" = [{class = "steam";}];
    "5" = [{class = "vesktop";}];
    "6" = [{class = "Spotify";} {title = "^spotify_player$";}];
  };
}
