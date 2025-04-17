{ ... }:

{
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
    };
  };
}
