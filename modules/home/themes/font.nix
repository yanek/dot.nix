{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkDefault;
in
{
  stylix.fonts = {
    serif = mkDefault {
      package = pkgs.noto-fonts;
      name = "Noto Serif";
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
      package = pkgs.iosevka-bin;
      name = "Iosevka";
    };

    sizes = mkDefault {
      applications = 10;
      desktop = 11;
      popups = 11;
      terminal = 13;
    };
  };

  home.packages =
    [
      pkgs.noto-fonts
      pkgs.iosevka-bin
    ]
    ++ lib.map
      (
        variant:
        pkgs.iosevka-bin.override {
          inherit variant;
        }
      )
      [
        ""
        "Slab"
        "Etoile"
        "Aile"
      ];
}
