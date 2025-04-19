{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
