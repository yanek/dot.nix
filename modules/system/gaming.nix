{ pkgs, ... }:

{
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

  # TODO: This could probably be moved on the home side.
  # But ideally, I would like to move the whole steam installation
  # I still need to do some investigation on that matter...
  environment.systemPackages = with pkgs; [
    ckan
  ];
}
