{
  config,
  lib,
  ...
}:
with lib; {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-center";
        offset = "(0,34)";
        width = 640;
        progress_bar = true;
        frame_width = 1;
        gap_size = 8;
        corner_radius = 8;
        format = "<b>%s</b>\n%b";
        alignment = "left";
      };
      urgency_normal = {
        background = mkForce config.lib.stylix.colors.withHashtag.base02;
        frame_color = mkForce config.lib.stylix.colors.withHashtag.base04;
      };
    };
  };
}
