{ pkgs, ... }:

{
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra}";
      }
      {
        name = "odin";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
  };
}
