{ pkgs, userSettings, ... }:

{
  imports = [
    ../mod/usr/git.nix
    ../mod/usr/multimedia.nix
    ../mod/usr/3d-printing.nix
    ../mod/usr/fish.nix
    ../mod/usr/starship/starship.nix
    ../mod/usr/eza.nix
    ../mod/usr/bat.nix
    ../mod/usr/fzf.nix
    ../mod/usr/zoxide.nix
  ];

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.homeDir}";

  home.sessionPath = [
    "${userSettings.homeDir}/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  stylix.fonts = {
    serif = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Serif";
    };

    sansSerif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
    };

    monospace = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Mono";
    };
  };

  stylix.cursor = {
    name = "Nordic-cursors";
    package = pkgs.nordic;
    size = 24;
  };

  gtk.enable = true;
  # gtk.cursorTheme = {
  #   name = "Nordic-cursors";
  #   package = pkgs.nordic;
  #   size = 24;
  # };
  # gtk.theme = {
  #   name = "Nordic";
  #   package = pkgs.nordic;
  # };
  gtk.iconTheme = {
    name = "Nordic-blueish";
    package = pkgs.nordic;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
