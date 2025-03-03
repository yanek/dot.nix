{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      l = "ls";
      ll = "ls -l";
      la = "ll -a";
      sudo = "doas";
    };
    shellInit = "fish_vi_key_bindings";
  };
}
