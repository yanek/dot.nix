{
  pkgs,
  lib,
  ...
}:
with lib;
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
      package = pkgs.nerd-fonts.commit-mono;
      name = "CommitMono Nerd Font";
    };

    sizes = mkDefault {
      applications = 11;
      desktop = 11;
      popups = 11;
      terminal = 11;
    };
  };
}
