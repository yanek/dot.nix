{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment = {
    shells = with pkgs; [
      bash
      fish
    ];
    users.defaultUserShell = pkgs.fish;
    systemPackages = with pkgs; [
      wget
      git
      zoxide
      eza
      bat
      yazi
      lazygit
      starship
      helix
      nil
      nixfmt-rfc-style
      gnumake
      unzip
    ];
  };

  programs = {
    bash.enable = true;
    zsh.enable = true;
  };
}
