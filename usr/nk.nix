{ userSettings, ... }:

{
  imports = [
    ../mod/usr/theme/${userSettings.theme}.nix
    ../mod/usr/git.nix
    ../mod/usr/multimedia.nix
    ../mod/usr/3d-printing.nix
    ../mod/usr/fish.nix
    ../mod/usr/starship/starship.nix
    ../mod/usr/eza.nix
    ../mod/usr/bat.nix
    ../mod/usr/fzf.nix
    ../mod/usr/zoxide.nix
    ../mod/usr/wezterm/wezterm.nix
    ../mod/usr/helix/helix.nix
    ../mod/usr/yazi.nix
  ];

  home.username = "${userSettings.username}";
  home.homeDirectory = "${userSettings.homeDir}";

  home.sessionPath = [
    "${userSettings.homeDir}/.local/bin"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
