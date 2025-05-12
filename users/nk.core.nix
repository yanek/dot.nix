{userSettings, ...}: {
  imports = [
    ../modules/home
    ../legacy/themes/${userSettings.theme}

    ../legacy/wm/sway
    ../legacy/wm/sway/output.nix

    ../legacy/programs/neovim
    ../legacy/programs/nh.nix
    ../legacy/programs/git
    ../legacy/programs/obsidian.nix
    ../legacy/programs/fish.nix
    ../legacy/programs/starship/starship.nix
    ../legacy/programs/cli
    ../legacy/programs/kitty.nix
    ../legacy/programs/helix/helix.nix
    ../legacy/programs/firefox.nix
    ../legacy/programs/comms/discord.nix
    ../legacy/programs/doc-viewer.nix
    ../legacy/programs/mail.nix

    ../legacy/programs/multimedia/spotify.nix
    ../legacy/programs/multimedia/vlc.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.dirs.home}";
  xdg.userDirs.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
