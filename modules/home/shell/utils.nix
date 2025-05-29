{ pkgs, ... }:
{
  programs = {
    bat = {
      enable = true;
      config = {
        map-syntax = [ ".*ignore:Git Ignore" ];
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batwatch
        prettybat
      ];
    };
    eza = {
      enable = true;
      colors = "always";
      icons = "always";
      git = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      extraOptions = [
        "--time-style=relative"
        "--group-directories-first"
      ];
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    ripgrep = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    fish.shellAbbrs = {
      "cd" = "z";
      "cat" = "bat";
      "man" = "batman";
      "l" = "eza";
    };
  };
}
