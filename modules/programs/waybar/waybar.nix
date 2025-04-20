{ ... }:

{
  programs.waybar.enable = true;

  programs.waybar.settings.topBar = {
    layer = "top";
    position = "top";
    height = 30;

    output = [
      "DP-6"
      "DP-5"
    ];

    modules-left = [
      "sway/workspaces"
      "sway/mode"
    ];
    modules-center = [ "sway/window" ];
    modules-right = [
      "cpu"
    ];

    "cpu" = {
      interval = 10;
      format = "{}% ";
      max-length = 10;
    };

    "sway/workspace" = {
      disable-scroll = true;
      all-outputs = true;
    };
  };
}
