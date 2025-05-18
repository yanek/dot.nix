{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.mySystem.gaming = {
    enable = mkEnableOption "gaming";
  };

  config = mkIf config.mySystem.gaming.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          reaper_freq = 5;
          desiredgov = "performance";
          desiredprof = "performance";
          softrealtime = false;
          renice = 10;
        };
        cpu = {
          park_core = false;
          pin_core = true;
        };
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
