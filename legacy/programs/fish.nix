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
      # cd into directory on yazi exit
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
      # mkdir + cd into
      mkcd = ''
        mkdir -pv $argv
        cd $argv
      '';
    };

    plugins = [
      {
        name = "fzf.fish";
        src = pkgs.fishPlugins.fzf-fish;
      }
    ];
  };
}
