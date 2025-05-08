{userSettings, ...}: {
  imports = [
    ../modules/user-dirs.nix
    ../modules/themes/${userSettings.theme}

    ../modules/wm/sway/sway.nix

    ../modules/programs/neovim
    ../modules/programs/nh.nix
    ../modules/programs/ags
    ../modules/programs/git/git.nix
    ../modules/programs/obsidian.nix
    ../modules/programs/fish.nix
    ../modules/programs/starship/starship.nix
    ../modules/programs/cli
    ../modules/programs/kitty.nix
    ../modules/programs/helix/helix.nix
    ../modules/programs/firefox.nix
    ../modules/programs/prusa-slicer.nix
    ../modules/programs/comms/discord.nix
    ../modules/programs/zathura.nix
    ../modules/programs/mail.nix

    ../modules/programs/multimedia/spotify.nix
    ../modules/programs/multimedia/vlc.nix
    ../modules/programs/multimedia/gimp.nix

    ../modules/programs/multimedia/spotify.nix
    ../modules/programs/multimedia/vlc.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.dirs.home}";

  home.sessionPath = [
    "${userSettings.dirs.home}/.local/bin"
  ];

  wayland.windowManager.sway.config.gaps.inner = 8;

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
