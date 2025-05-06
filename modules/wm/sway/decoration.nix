{lib, ...}: {
  wayland.windowManager.sway.extraConfig = ''
    smart_gaps inverse_outer

    shadows enable
    shadows_on_csd enable
    shadow_blur_radius 20
    shadow_color #0000007F
  '';

  wayland.windowManager.sway.config = {
    gaps.inner = lib.mkDefault 8;
    window.border = 2;
    window.titlebar = false;
    floating.border = 2;
    floating.titlebar = false;
  };
}
