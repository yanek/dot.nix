{ ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
