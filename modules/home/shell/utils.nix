{
  programs = {
    bat = {
      enable = true;
      config = {
        map-syntax = [".*ignore:Git Ignore"];
      };
    };
    eza = {
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
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    ripgrep = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
