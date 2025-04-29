{pkgs, ...}: {
  programs.helix.languages = {
    language-server = {
      # Nix
      nixd = {
        command = "${pkgs.nixd}/bin/nixd";
      };

      # TOML
      taplo = {
        command = "${pkgs.taplo}/bin/taplo";
        args = ["lsp" "stdio"];
      };

      # YAML
      yaml-language-server = {
        command = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        args = ["--stdio"];
      };

      # Lua
      lua-language-server = {
        command = "${pkgs.lua-language-server}/bin/lua-language-server";
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
