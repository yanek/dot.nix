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
          (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
            mktplcRef = {
              name = "vscode-icontheme-nomo-dark";
              publisher = "be5invis";
              version = "1.3.6";
              hash = "sha256-HEym2csu6PU+zKKFWBQP4DwpmD+ntYPtXOIbUv4BmtA=";
            };
          })
        ];

        userSettings =
          let
            fontSize = 14;
            fontFamily = config.stylix.fonts.monospace.name;
          in
          {
            "editor.bracketPairColorization.enabled" = false;
            "extensions.experimental.affinity" = {
              "asvetliakov.vscode-neovim" = 1;
            };
            "workbench.iconTheme" = "vs-nomo-dark";
            "editor.fontFamily" = fontFamily;
            "editor.inlayHints.editor.fontFamily" = fontFamily;
            "editor.inlineSuggest.editor.fontFamily" = fontFamily;

            "editor.fontSize" = fontSize;
            "terminal.integrated.fontSize" = fontSize;
          };

      };
    };

    home.sessionVariables = lib.mkIf cfg.isDefaultEditor {
      EDITOR = "code";
      VISUAL = "code";
    };
  };
}
