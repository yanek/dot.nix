{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    bat
    fd
    fzf
    unzip
    eza
    git
    ripgrep
    tldr
    zoxide
  ];

  programs.eza = {
    enable = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.git = {
    enable = true;
    userName = userSettings.fullname;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "*";
    };
  };

  programs.zsh = {
    shellAliases = {
      ls = "eza";
      cat = "bat --theme=gruvbox-dark";
      cd = "z";
    };
  };

}
