{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./fonts.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = ./scheme.yaml;
    polarity = "light";

    cursor = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
      size = 24;
    };

    iconTheme = {
      enable = true;
      dark = "Papirus";
      package = pkgs.papirus-nord;
    };

    targets.gtk = {
      enable = true;
      extraCss = ''
        window.background { border-radius: 0; }
      '';
    };

    opacity = {
      terminal = 0.9;
      desktop = 0.9;
      applications = 0.9;
      popups = 0.9;
    };

    targets."waybar".enable = false;
  };

  programs.tofi.settings = {
    selection-color = lib.mkForce (config.lib.stylix.colors.base0B);
  };
}
