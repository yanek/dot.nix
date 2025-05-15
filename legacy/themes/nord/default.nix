{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./overrides.nix
  ];

  home.file.".config/waybar/scheme.css".source = ./scheme.css;

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = ./scheme.yaml;
    image = ./wallpaper.png;

    cursor = {
      name = "Hackneyed";
      package = pkgs.hackneyed;
      size = 24;
    };

    iconTheme = {
      enable = true;
      dark = "Papirus";
      package = pkgs.papirus-nord;
    };

    targets.gtk = {
      extraCss = ''window.background { border-radius: 0; }'';
    };

    targets.cava.rainbow.enable = true;
  };
}
