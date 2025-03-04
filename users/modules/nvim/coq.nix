{ pkgs, ... }:
{
  plugins = {
    coq-nvim = {
      enable = true;
      installArtifacts = true;
      settings.auto_start = true;
      settings.keymap.recommended = true;
    };
  };
}
