{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Retina";
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

    cursor = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
      size = 24;
    };

    targets."gtk".enable = false;
    targets."helix".enable = false;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    iconTheme = {
      name = "Nordic-blueish";
      package = pkgs.nordic;
    };
  };

  programs.helix = {
    settings = {
      theme = "nord";
    };
  };
}
