{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
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
        name = "hydro";
        inherit (hydro) src;
      }
    ];
  };
}
