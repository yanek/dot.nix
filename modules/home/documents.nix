{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.documents = {
    enable = mkEnableOption "documents";
  };

  config = mkIf config.myHome.documents.enable {
    home.packages = [
      pkgs.mcomix
    ];

    programs.zathura = {
      enable = true;
    };
  };
}
