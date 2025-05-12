{lib, ...}: {
  wayland.windowManager.sway.extraConfig = ''
    smart_gaps inverse_outer
  '';

  wayland.windowManager.sway.config = {
    gaps.inner = lib.mkDefault 8;
    window.border = 2;
    window.titlebar = false;
    floating.border = 2;
    floating.titlebar = false;
  };
}
