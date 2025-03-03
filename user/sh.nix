{ ... }:

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

  programs.fish = {
    enable = false;
    shellAliases = {
      l = "ls";
      ll = "ls -l";
      la = "ll -a";
      sudo = "doas";
    };
    shellInit = "fish_vi_key_bindings";
  };
}
