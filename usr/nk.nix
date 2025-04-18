{ userSettings, ... }:

{
  imports = [
    ../mod/usr/theme/${userSettings.theme}.nix
    ../mod/usr/i3wm/i3wm.nix

    ../mod/usr/git.nix
    ../mod/usr/fish.nix
    ../mod/usr/starship/starship.nix
    ../mod/usr/eza.nix
    ../mod/usr/bat.nix
    ../mod/usr/fzf.nix
    ../mod/usr/zoxide.nix
    ../mod/usr/yazi.nix

    ../mod/usr/wezterm/wezterm.nix
    ../mod/usr/helix/helix.nix

    ../mod/usr/librewolf.nix
    ../mod/usr/3d-printing.nix
    ../mod/usr/media.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.homeDir}";

  home.sessionPath = [
    "${userSettings.homeDir}/.local/bin"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
