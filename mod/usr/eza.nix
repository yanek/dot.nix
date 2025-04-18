{ ... }:

{
  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = [
      "--time-style=relative"
      "--group-directories-first"
    ];
  };
}
