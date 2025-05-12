{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./input.nix
    ./monitors.nix
    ./environment.nix
    ./decoration.nix
    ./window.nix
    ./windowrules.nix
    ./startup.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.enable = false;
    settings.ecosystem.no_donation_nag = true;
    settings.misc.disable_hyprland_logo = true;
    settings.misc.disable_splash_rendering = true;
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_THREADED_OPTIMIZATIONS = "0";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
