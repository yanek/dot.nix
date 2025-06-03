{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.myHome.term.name == "kitty") {
    myHome.term = {
      package = pkgs.kitty;
      command = "${lib.getExe pkgs.kitty}";
    };

    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableFishIntegration = true;
        enableBashIntegration = true;
      };
      settings = {
        window_padding_width = 10;
        enable_audio_bell = false;
      };
    };
  };
}
