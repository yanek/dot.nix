{
  config,
  lib,
  ...
}:
with lib; {
  options.myHome.theme = {
    variant = lib.mkOption {
      default = "nord";
      type = types.str;
    };
  };

  config.stylix = lib.mkIf (config.myHome.theme.variant != "") {
    enable = true;
    targets = {
      cava.rainbow.enable = true;
      gtk.extraCss = ''window.background { border-radius: 0; }'';
    };
  };

  imports = [
    ./font.nix
    ./nord
  ];
}
