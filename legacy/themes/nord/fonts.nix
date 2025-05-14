{pkgs, ...}: {
  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts;
      name = "Noto Serif";
    };

    sansSerif = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    monospace = {
      package = pkgs.commit-mono;
      name = "CommitMono";
    };

    sizes = {
      applications = 11;
      desktop = 11;
      popups = 11;
      terminal = 11;
    };
  };
}
