{
  config,
  lib,
  pkgs,
  ...
}:
let
  isTheme = config.myHome.theme.variant == "kanagawa";
in
{
  config = lib.mkIf isTheme {
    stylix = {
      polarity = "dark";
      base16Scheme = ./kanagawa-dragon.yaml;
      targets = {
        nvf.enable = false;
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
          "kanagawa.nvim" = {
            package = kanagawa-nvim;
            lazy = false;
          };
        };
        luaConfigRC.kanagawa = "vim.cmd('colorscheme kanagawa-dragon')";
      };

    };
  };
}
