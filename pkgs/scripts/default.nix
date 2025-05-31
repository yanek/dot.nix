{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) getExe;
  inherit (pkgs) writeShellApplication;
  inherit (builtins) readFile;

  writeZxApplication =
    {
      name,
      runtimeInputs ? [ ],
      text,
    }:
    let
      src = pkgs.writeTextFile {
        inherit name text;
        executable = true;
        destination = "/bin/${name}.mjs";
      };
    in
    writeShellApplication {
      inherit name runtimeInputs;
      text = ''
        ${getExe pkgs.zx} ${src}/bin/${name}.mjs "$@"
      '';
    };
in
{
  home.packages = [
    (writeZxApplication {
      name = "rofi_power";
      text = readFile ./rofi_power.mjs;
    })
    (writeZxApplication {
      name = "rofi_sinks";
      text = readFile ./rofi_sinks.mjs;
    })
    (writeShellApplication {
      name = "polybar_spotify";
      runtimeInputs = [
        pkgs.procps
        pkgs.playerctl
        pkgs.ripgrep
        pkgs.coreutils
      ];
      text = readFile ./polybar_spotify.sh;
    })
  ];
}
