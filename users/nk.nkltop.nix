{userSettings, ...}: {
  imports = [
    ../modules/home
    ../modules/themes/${userSettings.theme}

    ../modules/wm/sway

    ../modules/programs/neovim
    ../modules/programs/nh.nix
    ../modules/programs/git
    ../modules/programs/obsidian.nix
    ../modules/programs/fish.nix
    ../modules/programs/starship/starship.nix
    ../modules/programs/cli
    ../modules/programs/kitty.nix
    ../modules/programs/helix/helix.nix
    ../modules/programs/firefox.nix
    ../modules/programs/comms/discord.nix
    ../modules/programs/doc-viewer.nix
    ../modules/programs/mail.nix

    ../modules/programs/multimedia/spotify.nix
    ../modules/programs/multimedia/vlc.nix
    ../modules/programs/multimedia/gimp.nix

    ../modules/programs/multimedia/spotify.nix
    ../modules/programs/multimedia/vlc.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.dirs.home}";
  xdg.userDirs.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
