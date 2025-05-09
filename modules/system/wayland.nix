{pkgs, ...}: {
  programs.dconf.enable = true;

  # programs.uwsm = {
  #   enable = true;
  #   waylandCompositors.hyprland = {
  #     prettyName = "Hyprland";
  #     comment = "Hyprland compositor managed by UWSM";
  #     binPath = "/run/current-system/sw/bin/Hyprland";
  #   };
  # };

  security.polkit.enable = true;

  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
  ];

  security.pam.services.swaylock = {};

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common.default = ["gtk"];
    };
  };

  environment.sessionVariables = {
    WLR_RENDERER = "vulkan";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_THREADED_OPTIMIZATIONS = "0";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wlprop
    newt
    libnotify
  ];
}
