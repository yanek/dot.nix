{userSettings, ...}: let
  # xrandrArgs = "--output DP-4 --mode 3440x1440 --rate 144.00 --pos 0x1440 --output DP-2 --mode 2560x1440 --rate 143.97 --pos 440x0";
in {
  imports = [
    ../modules/user-dirs.nix
    ../modules/themes/${userSettings.theme}

    ../modules/wm/sway
    ../modules/wm/sway/output.nix

    ../modules/programs/neovim
    ../modules/programs/nh.nix
    ../modules/programs/ags
    ../modules/programs/git
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
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.dirs.home}";

  home.sessionPath = [
    "${userSettings.dirs.home}/.local/bin"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
