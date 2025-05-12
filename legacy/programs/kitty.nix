{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    settings = {
      window_padding_width = 10;
    };
  };
}
