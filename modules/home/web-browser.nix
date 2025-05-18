{
  config,
  lib,
  inputs,
  userSettings,
  ...
}:
with lib; {
  options.myHome.web-browser = {
    firefox.enable = mkEnableOption "firefox";
    chromium.enable = mkEnableOption "chromium";
  };

  config = {
    stylix.targets."firefox".profileNames = [config.home.username];
    programs = {
      firefox = mkIf config.myHome.web-browser.firefox.enable {
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
      chromium = mkIf config.myHome.web-browser.chromium.enable {
        enable = true;
        extensions = [
          {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origins
          {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
        ];
      };
    };
  };

  imports = [inputs.betterfox.homeManagerModules.betterfox];
}
