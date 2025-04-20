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

    sizes.applications = 10;
    sizes.desktop = 10;
    sizes.popups = 10;
    sizes.terminal = 10;
  };
}
