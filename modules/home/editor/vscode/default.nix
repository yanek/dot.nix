{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.spec.home.editor.vscode;
in
{
  options.spec.home.editor.vscode = {
    enable = lib.mkEnableOption "vscode";
    isDefaultEditor = lib.mkOption {
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;
      profiles.default = {
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;

        extensions = with pkgs.vscode-extensions; [
          asvetliakov.vscode-neovim
          geequlim.godot-tools
        ];

        userSettings = {
          "editor.bracketPairColorization.enabled" = false;
          "extensions.experimental.affinity" = {
            "asvetliakov.vscode-neovim" = 1;
          };
        };

      };
    };

    home.sessionVariables = lib.mkIf cfg.isDefaultEditor {
      EDITOR = "code";
      VISUAL = "code";
    };
  };
}
