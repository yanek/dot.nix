{ pkgs, ... }:
{
  language-server = {
    # Nix
    nixd = {
      command = "${pkgs.nixd}/bin/nixd";
    };
    nil = {
      command = "${pkgs.nil}/bin/nil";
    };

    # TOML
    taplo = {
      command = "${pkgs.taplo}/bin/taplo";
      args = [
        "lsp"
        "stdio"
      ];
    };

    # YAML
    yaml-language-server = {
      command = "${pkgs.yaml-language-server}/bin/yaml-language-server";
      args = [ "--stdio" ];
    };

    # Lua
    lua-language-server = {
      command = "${pkgs.lua-language-server}/bin/lua-language-server";
    };

    # Odin
    ols = {
      command = "${pkgs.ols}/bin/ols";
    };
  };
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      language-servers = [
        "nixd"
        "nil"
      ];
    }
    {
      name = "odin";
      auto-format = true;
      indent = {
        tab-width = 4;
        unit = "    ";
      };
      formatter.command = "${pkgs.ols}/bin/odinfmt";
      language-servers = [ "ols" ];
    }
  ];
}
