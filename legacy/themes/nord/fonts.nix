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
      package = pkgs.nerd-fonts.commit-mono;
      name = "CommitMono Nerd Font";
    };

    sizes.applications = 11;
    sizes.desktop = 11;
    sizes.popups = 11;
    sizes.terminal = 11;
  };
}
