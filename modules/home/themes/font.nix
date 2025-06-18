{
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
      package = pkgs.noto-fonts;
      name = "Noto Sans";
    };

    emoji = mkDefault {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    monospace = mkDefault {
      package = pkgs.hack-font;
      name = "Hack";
    };

    sizes = mkDefault {
      applications = 10;
      desktop = 10;
      popups = 10;
      terminal = 12;
    };
  };

  home.packages =
    [
      pkgs.noto-fonts
      pkgs.open-sans

      pkgs.commit-mono
      pkgs.jetbrains-mono
      pkgs.fira-code
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
