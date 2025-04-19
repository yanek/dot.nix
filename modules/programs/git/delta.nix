{ ... }:
{
  programs.git.delta = {
    enable = true;
    options = {
      dark = true;
      minus-style = "#bf616a bold";
      plus-style = "#a3be8c bold";
    };
  };
}
