{userSettings, ...}: {
  imports = [
    ../modules/themes/${userSettings.theme}/theme.nix

    ../modules/wm/hyprland

    ../modules/programs/git/git.nix
    ../modules/programs/fish.nix
    ../modules/programs/starship/starship.nix
    ../modules/programs/cli
    ../modules/programs/wezterm/wezterm.nix
    ../modules/programs/kitty.nix
    ../modules/programs/helix/helix.nix
    ../modules/programs/firefox.nix
    ../modules/programs/prusa-slicer.nix
    ../modules/programs/comms/discord.nix

    ../modules/programs/multimedia/spotify.nix
    ../modules/programs/multimedia/vlc.nix
    ../modules/programs/multimedia/gimp.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.dirs.home}";

  home.sessionPath = [
    "${userSettings.dirs.home}/.local/bin"
  ];

  # environment.loginShellInit = ''
  #   [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
  # '';

  programs.home-manager.enable = true;
  programs.btop.enable = true;
  home.stateVersion = "24.11";
}
