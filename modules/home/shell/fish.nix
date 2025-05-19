{pkgs, ...}: {
  programs.fish = {
    enable = true;
    preferAbbrs = true;

    shellAbbrs = {
      cd = "z";
      dev = "nix develop --command fish";
      gs = "git status";
      gl = "git lg";
      gcm = {
        setCursor = "%";
        expansion = "git commit -m \"%\"";
      };
      cat = "bat";
      qqq = "exit";
      l = "eza";
      cls = "clear";
      lg = "lazygit";
    };

    functions = {
      # mkdir + cd into
      mkcd =
        # fish
        ''
          mkdir -pv $argv
          cd $argv
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
