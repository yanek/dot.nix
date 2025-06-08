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

  writeNuApplication =
    {
      name,
      runtimeInputs ? [ ],
      text,
    }:
    let
      src = prev.writeText "${name}.nu" text;
    in
    prev.stdenv.mkDerivation {
      inherit src name;
      # buildInputs = [ prev.nushell ];
      unpackPhase = "true";
      buildInputs = runtimeInputs ++ [ prev.nushell ];
      nativeBuildInputs = [ prev.makeWrapper ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/$name
        chmod +x $out/bin/$name
      '';
      postFixup = ''
        wrapProgram $out/bin/${name} \
         --set PATH ${prev.lib.makeBinPath runtimeInputs}
      '';
      meta.mainProgram = name;
    };
in
{
  myScripts = {
    rofi_power = writeShellApplication {
      name = "rofi_power";
      text = readFile ./rofi_power.sh;
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

    file_catcher = writeZxApplication {
      name = "file_catcher";
      runtimeInputs = [
        prev.libnotify
        prev.rsync
        prev.inotify-tools
      ];
      text = readFile ./file_catcher.mjs;
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

    alert = writeShellApplication {
      name = "alert";
      text = readFile ./alert.sh;
    };

    status_net = writeShellApplication {
      name = "status_net";
      text = readFile ./status_net.sh;
    };

    status_battery = writeNuApplication {
      name = "status_battery";
      runtimeInputs = [ prev.acpi ];
      text = readFile ./status_battery.nu;
    };
  };
}
