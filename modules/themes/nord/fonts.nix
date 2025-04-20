{ pkgs, ... }:

{
  stylix.fonts = {
    serif = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Serif";
    };

    sansSerif = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell Regular";
    };

    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    sizes.applications = 11;
    sizes.desktop = 11;
    sizes.popups = 11;
    sizes.terminal = 11;
  };
}
