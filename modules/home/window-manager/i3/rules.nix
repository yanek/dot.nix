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
    "4" = [ { class = "steam"; } ];
    "5" = [
      { class = "vesktop"; }
      { class = "Spotify"; }
    ];
  };
}
