{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../modules/home
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
    windowManager.i3.enable = true;
    theme.variant = "ayu-dark";
    term.name = "wezterm";
    git.enable = true;
    documents.enable = true;
    comms.discord.enable = true;
    vlc.enable = true;
    spotify.cli.enable = true;
    yazi.enable = true;
    helix = {
      enable = true;
      isDefaultEditor = true;
    };
    web-browser = {
      firefox.enable = true;
      brave.enable = true;
    };
  };

  programs.home-manager.enable = true;
  services.gnome-keyring.enable = true;
}
