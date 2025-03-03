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
    nh
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    shellAliases = {
      ls = "eza";
      cat = "bat --theme=gruvbox-dark";
      cd = "z";
    };
  };

}
