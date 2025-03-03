{ pkgs, ... }:

{
  home.packages = [
    pkgs.eza
  ];

  programs.eza = {
    enable = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fish = {
    shellAliases = {
      ls = "eza";
    };
  };
}
