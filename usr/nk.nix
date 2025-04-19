{ userSettings, ... }:

{
  imports = [
    ../modules/usr/theme/${userSettings.theme}.nix
    ../modules/usr/i3wm/i3wm.nix

    ../modules/usr/git.nix
    ../modules/usr/fish.nix
    ../modules/usr/starship/starship.nix
    ../modules/usr/eza.nix
    ../modules/usr/bat.nix
    ../modules/usr/fzf.nix
    ../modules/usr/zoxide.nix
    ../modules/usr/yazi.nix

    ../modules/usr/wezterm/wezterm.nix
    ../modules/usr/helix/helix.nix

    ../modules/usr/librewolf.nix
    ../modules/usr/3d-printing.nix
    ../modules/usr/media.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.homeDir}";

  home.sessionPath = [
    "${userSettings.homeDir}/.local/bin"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
