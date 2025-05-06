{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./overrides.nix
  ];

  home.file.".config/waybar/scheme.css".source = ./scheme.css;

  stylix = {
    enable = true;
    base16Scheme = ./scheme.yaml;

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

    targets."waybar".enable = false;
  };
}
