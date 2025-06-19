{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "lackluster";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "dark";
      base16Scheme = ./lackluster.yaml;
      targets = {
        nvf.enable = false;
        vscode.enable = false;
      };
    };

    xsession.windowManager.i3.config.colors =
      with config.lib.stylix.colors.withHashtag;
      let
        inherit (lib) mkForce;
      in
      {
        focused = {
          indicator = mkForce base06;
          border = mkForce base03;
          childBorder = mkForce base03;
        };
        focusedInactive = {
          indicator = mkForce base00;
          border = mkForce base00;
          childBorder = mkForce base00;
        };
        unfocused = {
          indicator = mkForce base00;
          border = mkForce base00;
          childBorder = mkForce base00;
        };
      };

    programs = {
      nvf.settings.vim = {
        theme.enable = false;
        lazy.plugins = with pkgs.vimPlugins; {
          "lackluster.nvim" = {
            package = lackluster-nvim;
            lazy = false;
          };
        };
        luaConfigRC.rosebones = "vim.cmd('colorscheme lackluster')";
      };

      vscode.profiles.default = {
        extensions = [
          (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
            mktplcRef = {
              name = "monochrome";
              publisher = "anotherglitchinthematrix";
              version = "2.4.3";
              hash = "sha256-xk4YTT6a1RW/JnWl+r7O0c3ZN/lZM7uiEnCc9h7smZc=";
            };
          })
        ];
        userSettings = {
          "workbench.colorTheme" = "Dark Modern";
        };
      };
    };
  };
}
