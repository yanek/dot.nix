{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.spec.home.editor.helix;
in
{
  options.spec.home.editor.helix =
    let
      inherit (lib) mkOption mkEnableOption;
    in
    {
      enable = mkEnableOption "helix";
      isDefaultEditor = mkOption {
        default = false;
        type = lib.types.bool;
      };
    };

  config =
    let
      languages = import ./languages.nix { inherit pkgs lib; };
      settings = pkgs.lib.importTOML ./config.toml;
    in
    mkIf cfg.enable {
      programs.helix = {
        enable = true;
        inherit languages;
        inherit settings;
        package = pkgs.evil-helix;
      };

      home.sessionVariables = mkIf cfg.isDefaultEditor {
        EDITOR = "hx";
        VISUAL = "hx";
      };
    };
}
