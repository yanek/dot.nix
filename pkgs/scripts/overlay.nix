_final: prev:

let
  inherit (prev.lib) getExe;
  inherit (prev) writeShellApplication;
  inherit (builtins) readFile;

  writeZxApplication =
    {
      name,
      runtimeInputs ? [ ],
      text,
    }:
    let
      src = prev.writeTextFile {
        inherit name text;
        executable = true;
        destination = "/bin/${name}.mjs";
      };
    in
    writeShellApplication {
      inherit name;
      runtimeInputs = [
        prev.bash
        prev.coreutils
      ] ++ runtimeInputs;
      bashOptions = [ ];
      text = ''
        ${getExe prev.zx} ${src}/bin/${name}.mjs "$@"
      '';
    };
in
{
  myScripts = {
    rofi_power = writeZxApplication {
      name = "rofi_power";
      text = readFile ./rofi_power.mjs;
    };

    rofi_sinks = writeZxApplication {
      name = "rofi_sinks";
      text = readFile ./rofi_sinks.mjs;
    };

    prune_dir = writeZxApplication {
      name = "prune_dir";
      runtimeInputs = [ prev.libnotify ];
      text = readFile ./prune_dir.mjs;
    };

    polybar_spotify = writeShellApplication {
      name = "polybar_spotify";
      runtimeInputs = with prev; [
        procps
        playerctl
        ripgrep
        coreutils
      ];
      text = readFile ./polybar_spotify.sh;
    };
  };
}
