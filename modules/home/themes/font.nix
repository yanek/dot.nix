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
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };

    sizes = mkDefault {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 13;
    };
  };

  home.packages = [
    (pkgs.iosevka-bin.override {
      variant = "Etoile";
    })
    (pkgs.iosevka-bin.override {
      variant = "Aile";
    })
  ];
}
