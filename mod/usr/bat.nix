{ ... }:

{
  programs.bat = {
    enable = true;
    config = {
      map-syntax = [ ".*ignore:Git Ignore" ];
    };
  };
}
