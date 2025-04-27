{ pkgs, ... }:

{
  stylix.fonts = {
    serif = {
      package = pkgs.ibm-plex;
      name = "IBM Plex Serif";
    };

    sansSerif = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
    };

    monospace = {
      package = pkgs.maple-mono.NF;
      name = "MapleMono";
    };

    sizes.applications = 12;
    sizes.desktop = 11;
    sizes.popups = 12;
    sizes.terminal = 12;
  };
}
