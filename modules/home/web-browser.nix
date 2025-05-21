{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.myHome.web-browser;
in {
  options.myHome.web-browser = {
    firefox.enable = mkEnableOption "firefox";
    chromium.enable = mkEnableOption "chromium";
    brave.enable = mkEnableOption "brave";
  };

  config = {
    stylix.targets."firefox".profileNames = [config.home.username];
    programs = {
      firefox = mkIf cfg.firefox.enable {
        enable = true;
        betterfox = {
          enable = true;
        };
        profiles.${config.home.username} = {
          betterfox = {
            enable = true;
            enableAllSections = true;
            fastfox.enable = true;
            peskyfox = {
              enable = true;
              mozilla-ui.enable = false;
            };
            securefox = {
              enable = true;
              tracking-protection."browser.download.start_downloads_in_tmp_dir".value = false;
            };
          };
        };
      };
      chromium = mkIf cfg.chromium.enable {
        enable = true;
        extensions = [
          {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origins
          {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
        ];
      };
    };
    home.packages = mkIf cfg.brave.enable [
      pkgs.brave
    ];
  };

  imports = [inputs.betterfox.homeManagerModules.betterfox];
}
