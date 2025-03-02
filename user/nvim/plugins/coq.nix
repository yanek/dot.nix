{ pkgs, ... }:
{
  plugins = {
    coq-nvim = {
      enable = true;
      autoLoad = true;
      installArtifacts = true;
    };
  };
}
