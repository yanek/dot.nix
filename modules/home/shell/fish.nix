{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;

    shellAbbrs = {
      dev = "nix develop --command fish";
      qqq = "exit";
    };

    functions = {
      # mkdir + cd into
      mkcd =
        # fish
        ''
          mkdir -pv $argv
          cd $argv
        '';
      fman =
        # fish
        ''
          complete -C | cut -d \t -f 1 | fzf | xarg batman 
        '';
    };

    plugins = with pkgs.fishPlugins; [
      {
        name = "fzf.fish";
        src = fzf-fish;
      }
    ];
  };
}
