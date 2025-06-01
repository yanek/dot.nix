{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.myHome.webBrowser;
in
{
  options.myHome.webBrowser = {
    firefox.enable = mkEnableOption "firefox";
    chromium.enable = mkEnableOption "chromium";
    qutebrowser.enable = mkEnableOption "qutebrowser";
    brave.enable = mkEnableOption "brave";
  };

  config = {
    stylix.targets."firefox".profileNames = [ config.home.username ];
    programs = {

      firefox = mkIf cfg.firefox.enable {
        enable = true;
        betterfox = {
          enable = true;
        };
        profiles.${config.home.username} = {
          id = 0;
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "https://start.duckduckgo.com";
          };
          search = {
            force = true;
            default = "ddg"; # DuckDuckGo
            order = [
              "ddg"
            ];
          };
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
          { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origins
          { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
        ];
      };

      qutebrowser = mkIf cfg.qutebrowser.enable {
        enable = true;
        searchEngines = {
          d = "https://duckduckgo.com/{}";
          gh = "https://github.com/search?q={}";
          hm = "https://home-manager-options.extranix.com/?query={}";
        };
      };
    };

    home.packages = mkIf cfg.brave.enable [
      pkgs.brave
    ];
  };

  imports = [ inputs.betterfox.homeManagerModules.betterfox ];
}
