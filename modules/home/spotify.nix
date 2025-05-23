{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.myHome.spotify;
in {
  options.myHome.spotify = {
    gui.enable = mkEnableOption "gui";
    cli.enable = mkEnableOption "cli";
  };

  config = {
    programs = {
      spicetify = let
        spicepkgs = inputs.spicetify.legacyPackages.${pkgs.stdenv.system};
      in
        mkIf cfg.gui.enable {
          enable = true;
          enabledExtensions = with spicepkgs.extensions; [
            fullAppDisplay
            shuffle
          ];
        };

      spotify-player = mkIf cfg.cli.enable {
        enable = true;
      };
    };
    # services.spotifyd = mkIf cfg.cli.enable {
    #   enable = true;
    #   package = pkgs.spotifyd.override {
    #     withMpris = true;
    #   };
    #   settings.global = {
    #     use_mpris = true;
    #   };
    # };
  };
}
