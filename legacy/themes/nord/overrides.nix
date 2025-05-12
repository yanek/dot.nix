{
  config,
  lib,
  ...
}: {
  programs.tofi.settings = with config.lib.stylix.colors.withHashtag; {
    selection-color = lib.mkForce base0B;
  };

  wayland.windowManager.sway.config.colors = with config.lib.stylix.colors.withHashtag; {
    focused.indicator = lib.mkForce base0D;
    focused.border = lib.mkForce base0B;
    focused.childBorder = lib.mkForce base0B;
  };
}
