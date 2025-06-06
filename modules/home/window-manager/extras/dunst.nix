{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.myHome.windowManager.extras.dunst;
in
{
  options.myHome.windowManager.extras.dunst = {
    enable = mkEnableOption "dunst";
  };

  config = mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          origin = "top-right";
          offset = "(8,34)";
          width = "(320,960)";
          progress_bar = true;
          frame_width = 1;
          gap_size = 8;
          corner_radius = 0;
          format = "<b>%s</b>\n%b";
          alignment = "left";
        };
        urgency_normal = {
          background = mkForce config.lib.stylix.colors.withHashtag.base02;
          frame_color = mkForce config.lib.stylix.colors.withHashtag.base04;
        };
        play_sound = {
          summary = "*";
          script = lib.getExe pkgs.myScripts.alert;
        };
      };
    };
  };
}
