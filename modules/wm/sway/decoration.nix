{lib, ...}: {
  wayland.windowManager.sway.extraConfig = ''
    smart_gaps inverse_outer

    shadows enable
    shadows_on_csd enable
    shadow_blur_radius 20
    shadow_color #0000007F
  '';

  wayland.windowManager.sway.config = {
    gaps.inner = lib.mkDefault 16;
    window.border = 1;
    window.titlebar = false;
    floating.border = 1;
    floating.titlebar = false;
  };
}
