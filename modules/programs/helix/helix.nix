{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = pkgs.lib.importTOML ./config.toml;
    languages = pkgs.lib.importTOML ./languages.toml;
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
