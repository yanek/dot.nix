{ ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
  };
}
