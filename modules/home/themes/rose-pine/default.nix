{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "rose-pine";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      targets = {
        helix.enable = false;
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
      helix.settings.theme = lib.mkForce "rose_pine";
      nvf.settings.vim = {
        theme.enable = false;
        lazy.plugins = with pkgs.vimPlugins; {
          "rose-pine" = {
            package = rose-pine;
            lazy = false;
          };
        };
        luaConfigRC.rose-pine = "vim.cmd('colorscheme rose-pine')";
      };
    };
  };
}
