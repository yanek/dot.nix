{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "gruvbox-dark";
      default_shell = "fish";
      pane_frames = false;
      simplified_ui = true;
    };
  };

  programs.fish = {
    interactiveShellInit = "eval (zellij setup --generate-auto-start fish | string collect)";
  };

  home.sessionVariables = {
    ZELLIJ_AUTO_ATTACH = "true";
    ZELLIJ_AUTO_EXIT = "true";
  };
}
