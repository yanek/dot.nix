{pkgs, ...}: {
  programs.helix.languages = {
    language-server = {
      nixd = {
        command = "${pkgs.nixd}/bin/nixd";
      };
    };
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
        language-servers = ["nixd"];
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
