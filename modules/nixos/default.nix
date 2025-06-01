{
  pkgs,
  systemSettings,
  ...
}:
{
  nix.settings = {
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  time.timeZone = "Europe/Paris";

  security = {
    sudo.wheelNeedsPassword = false;
  };

  environment = {
    shells = with pkgs; [
      bash
      fish
    ];

    systemPackages = with pkgs; [
      uutils-coreutils-noprefix
      rsync
      unzip
      bc
      fd
      ripgrep
    ];

    sessionVariables = {
      FORCE_NIX_STABLE = "false";
    };
  };

  programs = {
    fish.enable = true;
  };

  users = {
    defaultUserShell = pkgs.fish;
  };

  i18n = {
    defaultLocale = systemSettings.locale;
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  imports = [
    ./ssh.nix
    ./audio.nix
    ./ollama.nix
    ./xorg.nix
    ./nvidia.nix
    ./nas-client.nix
    ./bluetooth.nix
    ./stylix.nix
    ./gaming.nix
  ];
}
