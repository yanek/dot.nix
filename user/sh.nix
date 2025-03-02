{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.zoxide
    pkgs.bat
    pkgs.fzf
    pkgs.duf
    pkgs.dust
    pkgs.eza
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      cat = "bat --theme=gruvbox-dark";
      ls = "eza";
      l = "ls";
      ll = "ls -l";
      la = "ll -a";
      sudo = "doas";
      duf = "df";
      dust = "du";
    };
    shellInit = "fish_vi_key_bindings";
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };
}
