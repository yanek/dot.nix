{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set pure_enable_single_line_prompt true
      set pure_enable_nixdevshell true
    '';

    shellAbbrs = {
      dev = "nix develop --command fish";
      qqq = "exit";
    };

    functions = {
      mkcd = ''
        mkdir -pv $argv
        cd $argv
      '';
      fman = ''
        complete -C | cut -d \t -f 1 | fzf | xarg batman 
      '';
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "fzf";
        inherit (fzf-fish) src;
      }
      {
        name = "pure";
        inherit (pure) src;
      }
    ];
  };
}
