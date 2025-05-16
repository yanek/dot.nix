{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../modules/home
    ../legacy/themes/${userSettings.theme}

    ../legacy/programs/neovim
    ../legacy/programs/nh.nix
    ../legacy/programs/git
    ../legacy/programs/obsidian.nix
    ../legacy/programs/fish.nix
    ../legacy/programs/starship/starship.nix
    ../legacy/programs/cli
    ../legacy/programs/helix/helix.nix
    ../legacy/programs/firefox.nix
    ../legacy/programs/comms/discord.nix
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
  };

  services.gnome-keyring.enable = true;

  xdg.userDirs.enable = true;
  myHome.windowManager.bspwm.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
