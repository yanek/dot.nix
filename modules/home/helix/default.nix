{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.myHome.helix = {
    enable = mkEnableOption "helix";
    isDefaultEditor = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkIf config.myHome.helix.enable {
    programs.helix = {
      enable = true;
      package = pkgs.evil-helix;
      settings = pkgs.lib.importTOML ./config.toml;
      languages = import ./languages.nix {inherit pkgs;};
    };

    home.sessionVariables = mkIf config.myHome.helix.isDefaultEditor {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };
}
