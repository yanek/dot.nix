{
  pkgs,
  lib,
  ...
}:
with lib;
{
  stylix.fonts = {
    serif = mkDefault {
      package = pkgs.iosevka.override {
        set = "Etoile";
        privateBuildPlan = {
          family = "Iosevka Etoile";
          spacing = "quasi-proportional";
          serifs = "slab";
        };
      };
      name = "Iosevka Etoile";
    };

    sansSerif = mkDefault {
      package = pkgs.iosevka.override {
        set = "Aile";
        privateBuildPlan = {
          family = "Iosevka Aile";
          spacing = "quasi-proportional";
          serifs = "sans";
        };
      };
      name = "Iosevka Aile";
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
      applications = 11;
      desktop = 11;
      popups = 11;
      terminal = 12;
    };
  };
}
