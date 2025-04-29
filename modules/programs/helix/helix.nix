{ pkgs, ... }:

{
  imports = [
    ./languages.nix
  ];

  programs.helix = {
    enable = true;
    settings = pkgs.lib.importTOML ./config.toml;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
