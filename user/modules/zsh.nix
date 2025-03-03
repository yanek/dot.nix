{
  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "ls";
      ll = "ls -l";
      la = "ll -a";
      sudo = "doas";
    };
  };
}
