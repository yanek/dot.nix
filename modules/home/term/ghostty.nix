{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.myHome.term.name == "ghostty") {
    myHome.term = {
      package = pkgs.ghostty;
      command = "${lib.getExe pkgs.ghostty}";
    };

    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      settings = {
        window-decoration = "server";
        window-padding-x = 8;
        window-padding-y = 8;
      };
    };
  };
}
