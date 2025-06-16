{ pkgs, ... }:
{
  home =
    let
      inherit (builtins) replaceStrings;
      templatesPackage = pkgs.godot_4_4-export-templates-bin;
      templatesPath = ".local";
      templatesFile = replaceStrings [ "-" ] [ "." ] templatesPackage.version;
    in
    {
      packages = [
        pkgs.godot_4_4
        templatesPackage
      ];

      file.".local" = {
        source = templatesPackage;
        recursive = true;
      };
    };
}
