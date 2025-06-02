{
  inputs,
  pkgs,
  lib,
  ...
}:
with lib;
{
  stylix.fonts = {
    serif = mkDefault {
      package = inputs.apple-fonts.packages.${pkgs.system}.ny;
      name = "New York";
    };

    sansSerif = mkDefault {
      package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro;
      name = "SF Pro Display";
    };

    emoji = mkDefault {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    monospace = mkDefault {
      package = pkgs.iosevka;
      name = "Iosevka";
    };

    sizes = mkDefault {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 13;
    };
  };

  home.packages = [
    (pkgs.iosevka.override {
      set = "Etoile";
      privateBuildPlan = {
        family = "Iosevka Etoile";
        spacing = "quasi-proportional";
        serifs = "slab";
      };
    })
    (pkgs.iosevka.override {
      set = "Aile";
      privateBuildPlan = {
        family = "Iosevka Aile";
        spacing = "quasi-proportional";
        serifs = "sans";
      };
    })
  ];
}
