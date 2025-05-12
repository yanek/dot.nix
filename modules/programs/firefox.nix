{
  inputs,
  userSettings,
  ...
}: {
  imports = [inputs.betterfox.homeManagerModules.betterfox];

  stylix.targets."firefox".profileNames = [userSettings.username];

  programs.firefox = {
    enable = true;
    betterfox = {
      enable = true;
    };
    profiles.${userSettings.username} = {
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

  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=x11"
    ];
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origins
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
    ];
  };
}
