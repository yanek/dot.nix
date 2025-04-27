{
  pkgs,
  userSettings,
  inputs,
  ...
}:

{
  imports = [
    ../modules/themes/${userSettings.theme}/theme.nix

    ../modules/wm/sway/sway.nix
    ../modules/wm/sway/output.nix # manage monitors

    ../modules/programs/git/git.nix
    ../modules/programs/fish.nix
    ../modules/programs/starship/starship.nix
    ../modules/programs/cli/eza.nix
    ../modules/programs/cli/bat.nix
    ../modules/programs/cli/fzf.nix
    ../modules/programs/cli/zoxide.nix
    ../modules/programs/cli/yazi.nix
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
  home.homeDirectory = "${userSettings.homeDir}";

  home.sessionPath = [
    "${userSettings.homeDir}/.local/bin"
  ];

  home.packages = [
    inputs.bettercontrol.packages.${pkgs.system}.better-control
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
