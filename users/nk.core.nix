{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../modules/home

    ../legacy/programs/obsidian.nix
    ../legacy/programs/cli
    ../legacy/programs/doc-viewer.nix
    ../legacy/programs/mail.nix

    ../legacy/programs/multimedia/spotify.nix
    ../legacy/programs/multimedia/vlc.nix
  ];

  home = {
    username = "${userSettings.username}";
    homeDirectory = "${userSettings.dirs.home}";
    packages = with pkgs; [
      xfce.thunar
      pavucontrol
      gcr # Provides org.gnome.keyring.SystemPrompter
    ];
    stateVersion = "24.11";
  };

  xdg.userDirs.enable = true;

  myHome = {
    windowManager.bspwm.enable = true;
    theme.variant = "rose-pine";
    term.name = "wezterm";
    git.enable = true;
    comms.discord.enable = true;
    vlc.enable = true;
    spotify.enable = true;
    helix = {
      enable = true;
      isDefaultEditor = true;
    };
    web-browser = {
      firefox.enable = true;
      chromium.enable = true;
    };
  };

  programs.home-manager.enable = true;
  services.gnome-keyring.enable = true;
}
